library("shiny")
library("ggplot2")
source("plotter.R")
source("helpers.R")
source("global.R")

shinyServer(
    function(input, output) {
        getUnit <- reactive({ input$unit})
        getProtocol <- reactive({ input$protocol})
        getDate <- reactive({ input$day })
        getMethod <- reactive({ input$method })
        getTimeWindow <- reactive({ input$timeWindow})
        getStart <- reactive({ input$start })
        getEnd <- reactive({ input$end })

        getRealTraffic <- reactive({
            scan(paste(global.traffic_path, "/", getDate(),
                       "/", getTimeWindow(), "/", getUnit(),
                       ".txt", sep=""))
        })
        getDSNSF <- reactive({
            scan(paste(global.dsnsf_path, "/", getMethod(), "/", getDate(),
                       "/", getTimeWindow(), "/", getUnit(),
                       ".txt", sep=""))
        })

        output$img <- renderPlot({
            # 1 hour = 60 minutes = 3600 seconds
            # divided by the amount of time windows results in
            # the number of points per hour
            starting_point <- as.integer(getStart()) * 3600 / as.integer(getTimeWindow())
            ending_point <- as.integer(getEnd()) * 3600 / as.integer(getTimeWindow())
            p <- plot_comparison(getRealTraffic(), getDSNSF(),
                                 getUnit(), getDate(),
                                 start = starting_point,
                                 end = ending_point,
                                 tw = as.integer(getTimeWindow()))
            print(p)
        })

        output$table <- renderTable({
            m <- matrix(c(round(cor(getRealTraffic(), getDSNSF()), 6),
                          round(nmse(getRealTraffic(), getDSNSF()), 6)),
                        nrow=1)
            colnames(m) <- c("Correlation", "NMSE")
            rownames(m) <- c("Value")
            return(m)
        })
    })
