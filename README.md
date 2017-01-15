# PowerBI_Desktop_Refresh
PowerBI desktop refresh,  the change are refelcted in SSAS you can see that by running a query in DAX Studio  
Unfortunately, to do the backup it become tricky, as the file is saved under the PBIX file,  
http://www.sqlbi.com/articles/using-process-add-in-tabular-models/

although the local SSAS is refreshed with the latest data, the changes are not saved in the PBIX file (which is zipped *.abf plus metadata and reports), and the reports show the old data, which give the impression that the refresh did not work, if you want to save the changes, you need to click save on the PowerBI Desktop
I don't know how to trigger PowerBI desktop to refresh the view of the data in SSAS refreshed by external means
Please there is no guaranty whatever, always make a copy of your pbix before doing anything  
and Please keep voting for this idea to make PowerBI Desktop automation officially supported

https://ideas.powerbi.com/forums/265200-power-bi-ideas/suggestions/7345565-power-bi-designer-api
