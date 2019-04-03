
# ---> Read text-file if no RData file exists of if the text file is more recent
rdatfile<-paste0(csvfil,".RData")
if(!file.exists(rdatfile)){
    print(paste0("Load ",csvfil,".txt and generate new ",rdatfile))
    alldata<-read.csv(paste0(csvfil,".txt"),na.string="-999", quote = "")
    
    #Correction of CY 3.A.1 GE for 2014 
    if(cursubm == "20180508"){
      levels(alldata$value) <- c(levels(alldata$value), as.character(6855418.00/25330))
      alldata[alldata$variableUID == "323AB36B-6A46-4EDE-A81C-11235D6CB9BA" & alldata$year == 2014 & alldata$party == "CY", names(alldata) %in% c("value")] <- 6855418.00/25330
    }
    
    ct2check <- countries2[!countries2 %in% c("FM")]
    ct2check <- ct2check[!ct2check %in% unique(alldata$party)]
    
    if (length(ct2check) >= 1){
      answ1 <- readline(prompt = paste0("There is no data for: ", ct2check, "\nIf you are NOT happy with that, quit by pressing [n]+[enter]; \notherwise, press [enter] or any other key to continue processing the data..."))
      if (answ1 == "n") stop("killing...")
    }
      
    names(alldata)[1] <- "party_2char"
    alldata$party_3char <- substring(alldata$filename, 1, 3)
    party_2_3char <- unique(alldata[,names(alldata) %in% c("party_2char", "party_3char", "country_name")])

    party_2_3char <- merge(country4sub, party_2_3char, by.x = c("code2"), by.y = c("party_2char"), all = TRUE)
    party_2_3char <- party_2_3char[(!party_2_3char$country_name == "" | is.na(party_2_3char$country_name)) & !is.na(party_2_3char$long), ]
    party_2_3char <- party_2_3char[!as.vector(apply(party_2_3char, 1, function(x) sum(is.na(x))) == ncol(party_2_3char)), ]
    party_2_3char$party_3char <- ifelse(is.na(party_2_3char$party_3char) == TRUE, party_2_3char$code3, party_2_3char$party_3char) 
    party_2_3char$country_name <- ifelse(is.na(party_2_3char$country_name) == TRUE, party_2_3char$long, as.vector(party_2_3char$country_name)) 
    party_2_3char$code3 <- party_2_3char$party_3char
    party_2_3char$long <- party_2_3char$country_name
    party_2_3char <- party_2_3char[, !names(party_2_3char) %in% c("party_3char", "country_name")]
    party_2_3char <- party_2_3char[order(party_2_3char$code3), ]
      
    View(party_2_3char)
    write.csv(party_2_3char, paste0(csvfil1, "party_2_3char.csv"), row.names = FALSE)

    answ <- readline(prompt = "Please, check country codes in 'party_2_3char'.\nIf you find errors, quit by pressing [n]+[enter]; \notherwise, press [enter] or any other key to update 'country4sub' and to continue...")
    if (answ == "n") stop("killing...")
    
    sel <- party_2_3char$EU28 == 0 & party_2_3char$EUA == 0 & party_2_3char$EUC == 0
    country4sub <- party_2_3char[!sel, ]

    alldata <- alldata %>% select(party_3char, names(alldata)[-c(1,3)])
    names(alldata)[1] <- "party"
    
    #if(is.factor(alldata$value) == FALSE) alldata$value <- as.factor(alldata$value)
    
    print(paste0("saving  ", rdatfile))
    save(alldata,file=rdatfile)
    #}else if(file.info(paste0(csvfil,".txt"))$mtime>file.info(rdatfile)$mtime){
    #    print(paste0("Load updated",csvfil,".txt and generate new ",rdatfile))
    #    alldata<-read.csv(paste0(csvfil,".txt"),na.string="-999")
    #    save(alldata,file=rdatfile)
    
    if(!c("nir") %in% drive_ls(paste0("eealocatorplots/", cursubm))$name){
      drive_mkdir(paste0("eealocatorplots/", cursubm, "/nir/"))  # make folder in home Drive directory
      for(fls in (list.files(paste0(adrian, "/nir/"), full.names = TRUE))){
        drive_upload(media = fls, 
                     path = as_dribble(paste0("eealocatorplots/", cursubm, "/nir/")), 
                     #name = NULL, type = NULL, 
                     verbose = FALSE)
      }

    }else{
      #for(fls in (list.files(paste0(adrian, "/nir/"), full.names = TRUE))){
      #  drive_update(file = paste0("eealocatorplots/", cursubm, "/nir/", sub('.*\\/', '', fls)), 
      #               media = fls, 
      #               verbose = TRUE)
      #}
    }
    
    if(!c("crfs") %in% drive_ls(paste0("eealocatorplots/", cursubm))$name){
      drive_mkdir(paste0("eealocatorplots/", cursubm, "/crfs/"))  # make folder in home Drive directory
      for(fls in (list.files(paste0(adrian, "/crfs/"), full.names = TRUE))){
        drive_upload(media = fls, 
                     path = as_dribble(paste0("eealocatorplots/", cursubm, "/crfs/")), 
                     #name = NULL, type = NULL, 
                     verbose = FALSE)
      }
    }
    
}else{
    print(paste0("Retrieve ",rdatfile))
    load(rdatfile)
}
