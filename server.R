library(shiny)
library(DT)
library(dplyr)
library(googlesheets)

## ======================
#googleform_embed_link <- "https://docs.google.com/forms/d/1nHVBMG24OPij25hSTbL9BMYTGRIfYDC4mg3NIsZXTmg/viewform?embedded=true"
googleform_data_url <- "https://docs.google.com/spreadsheets/d/1xu7WIt3GFxKFYlSj1cXC3abStc2B8TeKEgSeJ5exXkk/pubhtml"
## ======================

shinyServer(function(input, output, session) {
  
  ss <- gs_url(googleform_data_url, lookup = FALSE, visibility = "public")
  
  output$googleForm <- renderUI({
    tags$iframe(id = "googleform",
                src = googleform_embed_link,
                width = 400,
                height = 625,
                frameborder = 0,
                marginheight = 0)
    
#   gs_read(ss, ws="Sheet1", range = "G2:G20")
    
    
  })
  
  
  output$googleFormData <- renderDataTable({
    input$refresh
    ss_dat <- gs_read(ss)
#       mutate(Timestamp = Timestamp %>%
#                as.POSIXct(format = "%m/%d/%Y %H:%M:%S", tz = "PST8PDT")) %>%
#       select(Timestamp, Name, Age = How.old.are.you.) %>%
#       arrange(desc(Timestamp))
    
    DT::datatable(ss_dat, filter='top')
   # colnames(ss_dat, do.NULL = TRUE, prefix = "Население")
    
    })
  
})
