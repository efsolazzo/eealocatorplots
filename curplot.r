# EU-GIRP (EU-Greenhouse gas Inventory Reporting Plots; eealocatorplots)
# File curplot.csv
# File required for the EU-GIRP R script eealocatorplots.r
# Purpose: steers the R script defining which plots need to be generated
#          see below for information how to use this file!!
#
# Adrian Leip <adrian.leip@jrc.ec.europa.eu>
#
# Content of file: 
#   - general settings
#   - definition of plot-requests for EU-GIRP
#


##############################################################################
#
#     GENERAL SETTINGS
#
##############################################################################
cursubm <- "20150807"
years2keep<-c(1990:2013)
invyear<-2015
invloc<-paste0("../",invyear)
csvfil <-"eealocatortest_2014_AllAllAll.csv"
csvfil <- "EEA_GHG_MMR_locator_20150323.cub_2015.csv"
csvfil <- "../2015/eealocator/eealocator_20150115_20150509"
csvfil <- paste0(invloc,"/eealocator/eealocator_",cursubm)
rdatallem <- paste0(csvfil,"_clean.RData")
rdatmeasu <- paste0(csvfil,"_measures.RData")
rdatmeta <- paste0(csvfil,"_metadata.RData")
checkloc<-paste0(invloc,"/checks/")
figdate<-format(Sys.time(), "%Y%m%d")


##############################################################################
#
#     GENERAL SETTINGS
#
##############################################################################
#Note: give here a list of the categories which should be included in the plotting				
#A. Category:
#   - either 'all', then each sector_number x method combination will be evaluated
#   - selection, e.g. 3* or 3.A.1. or 3.A.1 Dairy*
#     It can end with an asterix as wildcard 

#B. Plotvalues:     			
#    0: plot not needed				
#    1: Include VALUE plot				
#    2: Include TREND plot				
#    4: Include COUNTRY plot				
#    3 5 6 7: several plots according to the sum of the above		
#    all: is equivalent with 7

#C. Measure
#   AD: if the AD data should be plotted 			
#   EM: if the EM data should be plotted (according to below)				
#   IEF if the IEF data should be plotted (according to below)	
#   any other parameter as it is given in the metadim_row8measure.txt

#Example: curtask <- "3*,7,all" ==> Used for category 3 plots
#         curtask <- "all,7,EM" ==> Used for all emission plots

#cat,source,plotvalues,measure
#curtask <- "4.A*,7,EM"
#curtask <- "all,7,EM"
curtask <- "3*,7,all,1"
