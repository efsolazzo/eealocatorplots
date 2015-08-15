# Functions ####
# Clean up Cattle options
# Some animal types are given under 'allmethods', the options either 'sector_number' and/or 'allmethods'
# ---> put them all to 'sector-number': sector option animal
cleanCattle<-function(S,M){
    if(M=="Dairy Cattle"){S<-gsub("1 ","1 Option A ",S)}else   
        if(M=="Non-Dairy Cattle"){S<-gsub("1 ","1 Option A ",S)}else   
            if(M=="Mature Dairy Cattle"){S<-gsub("1 ","1 Option B",S)}else   
                if(M=="Other Mature Cattle"){S<-gsub("1 ","1 Option B",S)}else   
                    if(M=="Growing Cattle"){S<-gsub("1 ","1 Option B",S)}else   
                        if(M=="Other Cattle"){S<-gsub("1 ","1 Option C",S)}else   
                        {S}   
}


# Assign meastypes ####
alldata$meastype[alldata$unit %in% unitareas]<-"AREA"
alldata$meastype[alldata$unit == "TJ"]<-"FUEL"
alldata$meastype[alldata$unit == "1000s"]<-"POP"
alldata$meastype[alldata$unit=="kt" & grepl("^3",alldata$sector_number)]<-"EM"
alldata$meastype[alldata$unit == "kg N2O/kg N"]<-"IEF"
alldata$meastype[alldata$unit == "t dm/ha"]<-"YIELD"
alldata$meastype[alldata$measure == "Amount captured"]<-"CAPTURED"
alldata$meastype[alldata$measure == "Total organic product"]<-"ADORG"
alldata$meastype[alldata$measure == "Sludge removed"]<-"ADSLUDGE"
alldata$meastype[alldata$measure == "N in effluent"]<-"ADEFFLUENT"
alldata$meastype[alldata$measure == "Amount of CH4 flared"]<-"FLARED"
alldata$meastype[alldata$measure == "Amount of CH4 for energy recovery"]<-"RECOVERY"
alldata$meastype[alldata$type == "Biogenic"]<-"ADbio"
alldata$meastype[alldata$type == "Non-biogenic"]<-"ADnbio"
alldata$meastype[alldata$measure == "Crop  production"]<-"PROD"
alldata$meastype[alldata$measure == "Nitrogen excretion per MMS"]<-"NEXC"
alldata$meastype[alldata$measure == "Residue/ Crop ratio"]<-"RatioResCrop"
alldata$meastype[alldata$measure == "Fraction oxidized"]<-"FracOXIDIZED"
alldata$meastype[alldata$measure == "Fraction burned in fields"]<-"FracBURN"
alldata$meastype[alldata$measure == "N lost through leaching and run-off"]<-"Nleach"
alldata$meastype[alldata$measure == "Total N volatilised as NH3 and Nox"]<-"Nvol"
alldata$meastype[alldata$category == "Fraction of livestock N excretion"]<-"FracGASM"
alldata$meastype[alldata$category == "Fraction of N input to managed soils"]<-"FracLEACH"
alldata$meastype[alldata$category == "Fraction of synthetic fertilizer"]<-"FracGASF"

alldata<-alldata[,allfields]

# The word 'Farming' in 'allmethods' not required for upper-level animal types/category
alldata$method[alldata$method == "Tier 2"]<-""
# The work 'Tier 2' not required: differentiation by climate zone by MMS always Tier 2
levels(alldata$classification)[levels(alldata$classification)=="Additional Information (for Tier 2)"]<-"Tier 2"
alldata$type[alldata$type == "Additional Information"]<-""

alldata$sector_number<-unlist(lapply(c(1:nrow(alldata)),function(x) gsub("Other \\(please specify\\)","",alldata$sector_number[x])))
alldata$category<-unlist(lapply(c(1:nrow(alldata)),function(x) gsub("livestock","Livestock",alldata$category[x])))

# If the 'category' is part of 'sector_number' remove it from 'sector_number
# e.g. Dairy Cattle
#alldata$sector_number<-as.character(alldata$sector_number)
#alldata$method<-as.character(alldata$method)
alldata$sector_number<-unlist(lapply(c(1:nrow(alldata)),function(x) gsub(alldata$category[x],"",alldata$sector_number[x])))

#Duplicates with same UID but different sector_number
tmp1<-subset(alldata,select=sector_number)
tmp2<-unique(subset(alldata,select=-sector_number))
tmp1$rn<-row.names(tmp1)
tmp2$rn<-row.names(tmp2)
alldata<-merge(tmp1,tmp2,by="rn")
alldata<-alldata[,allfields]

measures<-unique(subset(alldata,select=uniquefields))


# Duplicate UIDs ####
if(nrow(measures)==length(measures$variableUID)){print("No duplicate UIDs")}else{
    stop("duplicate UIDs")
    # Remove duplicate UIDs -----------------------------------------------------------------------------
    # ---> there are duplicate UIDs...
    alldata$variableUID<-as.character(alldata$variableUID)
    duplicateuids<-read.csv("duplicateUIDs.csv",header=FALSE)
    names(duplicateuids)<-c("UID","SEC")
    for(changeuid in c(1:nrow(duplicateuids))){
        duplicateUID<-as.vector(duplicateuids[changeuid,"UID"])
        duplicateSEC<-as.vector(duplicateuids[changeuid,"SEC"])
        duplicateNEW<-gsub(substr(duplicateUID,1+nchar(duplicateUID)-nchar(duplicateSEC),nchar(duplicateUID)),duplicateSEC,duplicateUID)
        alldata$variableUID[alldata$variableUID==duplicateUID & alldata$sector_number==duplicateSEC]<-duplicateNEW
    }
}


#al20150809 - cleanCattle not really needed any more .... it is contained in Option
#cat3all<-alldata[grepl("^3",alldata$sector_number),allfields]
#cat3all$sector_number<-unlist(lapply(c(1:nrow(cat3all)),function(x)
#    cleanCattle(cat3all$sector_number[x],cat3all$category[x])))
#cat3all$option[grepl("Option",cat3all$option)]<-""


# catothe<-alldata[!grepl("^3",alldata$sector_number),]
# cat3all<-rbind(catothe,cat3all)
# alldata<-cat3all[order(as.numeric(row.names(cat3all))),allfields]
# rm(cat3all,catothe)
