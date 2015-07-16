library("shiny")

shinyUI(
    fixedPage(style = "padding-top: 20px;",
              "VizzZ",
              theme = "journal.css",
              tags$hr(),
              fixedRow(
                  column(2,
                         selectInput("unit",
                                     label = "Unit",
                                     choices = global.units),
                         selectInput("protocol",
                                     label = "Protocol",
                                     choices = global.protocols),
                         selectInput("day",
                                     label = "Day to be plotted",
                                     choices = c("2013/04/29",
                                                 "2013/04/30", "2013/05/01",
                                                 "2013/05/02", "2013/05/03"),
                                     selected = ("2013/04/29")),
                         selectInput("method",
                                     label = "Method",
                                     choices = global.availableMethods),
                        #  selectInput("metric",
                        #              label = "Metrics for fitness evaluation",
                        #              choices = (global.availableMetrics)),
                         selectInput("timeWindow",
                                     label = "Time Window",
                                     choices = global.time_windows,
                                     selected = (300)),
                         selectInput("start",
                                     label = "From",
                                     choices = global.hours,
                                     selected = (0)),
                         selectInput("end",
                                     label = "To",
                                     choices = global.hours,
                                     selected = (24))
                  ),
                  column(10,
                         plotOutput(outputId = "img", width = "100%"),
                         tags$hr(),
                         uiOutput("table", align="center")
                  )
              ),
              fixedRow(
                  column(12,
                         tags$hr(),
                         tags$div(class = "footer",
                                  p("Anderson Hiroshi Hamamoto @", align = "center"),
                                  p("Universidade Estadual de Londrina", align = "center"))
                  )
              )
    )
)
