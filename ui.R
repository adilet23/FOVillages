library(shiny)

library(DT)

shinyUI(fluidPage(
  
  titlePanel("Проект ВОЛС СНП РК 250+"),
  sidebarLayout(
    sidebarPanel(
      selectInput("dataset", "Выберите Область:", 
                  choices = c(
                    "Все области",
                    "Akomilnskaya область",
                    "A область", 
                    "B область",
                    "D область",
                    "F область",
                    "Jобласть",
                    "Z область",
                    "Ka область",
                    "Ko область",
                    "Ky область",
                    "M область",
                    "P область",
                    "S область",
                    "U область"
                    )),
      textOutput('text1'),
      submitButton("Update View")
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Table",DT::dataTableOutput("googleFormData"), actionButton("refresh", "Refresh Sheet")),
        tabPanel("Map", verbatimTextOutput("summary")),
        tabPanel("Diagrams", plotOutput("plot"))
        
        
      )
     
    )
  )
)
)
