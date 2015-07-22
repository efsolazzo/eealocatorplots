# EU-GIRP (EU-Greenhouse gas Inventory Reporting Plots
## R program to generate plots from EEA-locator CRF data

This program has been conceptualized and programmed by Adrian Leip
European Commission, Joint Research Centre (JRC), Institute for Environment and Sustainability, Ispra (VA), Italy
adrian.leip@jrc.ec.europa.eu
to support the EU GHG inventory system.

Start of project: October 2014
First version available (EU-GIRP.v3: May 2015)
Public repository on https://github.com/aleip/eealocatorplots.git


This folder contains the source code that are used to generate EEA plots for the EU GHG inventory (from 2015 onwards).

### The following software is required to run the code:
- R statistical software, see 
- bash scripting environment

### The following files are required to start the process:
- *eealocator_20150115_20150509.txt*: This is an *example* for a text-comma-separated file with the data that are needed for plotting. It is generated by a bash-script (eealocator_csv.bash) which prepares relevant data from a EEA-locator output (e.g. CRF_MMR_20150423.txt) into a working file. The name of the working file contains EEA-locator meta-information. This file has been generated on the basis of the following files:
   * *eealocator_csv.bash*: bash script extracting the data into the working file (see above). The script writes also to other files which are required for the plotting script: lists.txt and meta_data_dimensions.txt (see below). lists.txt contains all categories, measures, units, and parties that are included in the working file (in R format). 
   * *CRF_MMR_20150423.txt* (dummy name actual eea-locator text-file output): text file generated in parallel to the EEA-locator by the EEA
- *eealocatorplots.r*: main program to for the plots: EUIRplot-tool
- *attributes.txt*: contains the information on the colours and patterns to be used for the barplots. can be edited to change layout of of the plots
- *curplot.csv*: file that requests the plots to be generated. The information this file must contain is: category-source-gas combinations for which plots are to be generated. Parameter to be plotted (e.g. Activity data, emissions, ...) and type(s) of plot (see below). Please see the header of the file with further information on the format of the file.
- *metadim_row8measure.txt*: contains the info how the measures are related to 'activity data' and 'emissions'. This is important as each parameter needs to be related to a corresponding activity data

### Principles of the EUIRplot-tool
There are various types of plots that are possible, which are available for two types of data.
For each source category (e.g. animal type in category 'Enteric Fermentation') the following data are required: activity data (e.g. Population), emissions (by gas) and implied emission factor (by gas). They need to be indicated with the acronyms 'AD', 'EM', and 'IEF'. For other parameters (any acronym) they need to be linked to any AD (plot request in appropriate line of curplot.csv.
The EUIRplot-tool distinguishes the following two types of data:
- **Summable data (*ADEM*)**: Activity data, emissions etc. This are data for which it 'makes sense' to add the values of different countries and to calculate a 'contribution' from different countries. The available plots for summable data are:
  1. **'value'**: In an **ADEM-value** plot, the sum of the values V{t} of all countries (EU18+IS) are plotted in a barplot against the years. Thus also the 'value' plot shows the trend in absolute terms. It is done$ for all Activity data and emissions. The 10 countries (number can be modified) contributing (on average over the whole period) most to the EU28+IS sum are shown in a pre-defined pattern and their share is given next to the legend indicating also the name of the countries. All other countries are lumped to the category 'Other'.
  2. **'trend'**: In an **ADEM-trend** plot, for each year t the sum of change (in absolute values) of a parameter (V{t} - V{t-1}) is plotted. It is done$ for all Activity data and emissions. For emissions, the trend is determined both by changes in AD and IEF - thus the plot shows the 10 countries (number can be modified) contributing most to the average annual change over the whole period in a pre-defined pattern. Next to the legend the contribution to the average annual change is given, as well as the contribution to the average change in the country do to the trend in AD or IEF (not yet implemented).
- **Averageable data (*IEF*)**: Implied emissions factors, other parameters and factors. This are data for which a sum does not make sense, but the EU28+IS value must be calculated as (weighted) average. 
  1. **'value'**: In an **IEF-value** plot, the EU28+IS average (AD-weighted average) of the value (IEF or other factor) is plotted together with some statistical measures of the distribution across countries (boxplot): median (geometric mean), and lower and upper quartiles. Furthermore, the countries with the highest relative deviation from the EU28+IS average are plotted. In the legend, the mean, min and max value of the parameter is indicated. In practice, for each data point its relation to the EU28+IS average of the year is calculated and countries with the highest absolute difference to 1 are selected for the plot to ensure that all most important outliers are included.
  2. **'trend'**: In an **IEF-trend** plot, the EU28+IS average (arithmetic mean) of the inter-annual change of the value (IEF or other factor) is plotted together with some statistical measures of the distribution across countries (boxplot): median (geometric mean), and lower and upper quartiles. Selection of countries and content of legend is in analogy to the IEF-value plot. It may happen in particular for a IEF-trend plot (but in theory also for an IEF-value plot) that not all 'outliers' for a single year are covered by the 10 countries with the highest outliers; these points are then marked with another symbol not indicating which country it relates to, however these are usually relatively small inter-annual changes.
  3. **'countries'**: In an **IEF-countries** plot, for each country the range of values (IEF or other parameter) over the whole time period is plotted (min-max and median). 

$ Note: the implementation of the program is so far only for the agriculture sector!
