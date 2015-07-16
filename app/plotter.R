library("ggplot2")
library("scales")

plot_comparison <- function(real_traffic, dsnsf, unit, date, start=1, end=288, tw=300) {
    if (start == 0) start <- 1
    index <- start:end
    bits <- real_traffic[start:end]
    dsnsf <- dsnsf[start:end]
    lower <- bits * 0.8
    upper <- bits * 1.2

    dt <- data.frame(index, bits, dsnsf, lower, upper)

    start_i <- 1 + (start / 12)
    end_i <- 2 + (end / 12)
    t_intervals <- seq(from=0,
                       to=(86400 / tw),
                       by=(86400 / tw / 24))[start_i:end_i]
    t_labels <- c("00","01","02","03","04","05",
                  "06","07","08","09","10","11",
                  "12","13","14","15","16","17",
                  "18","19","20","21","22","23",
                  "23:55")[start_i:end_i]

    p <- ggplot(dt, aes(x=index, y=bits), color="green",
                width=15, height=6, dpi=300) +
        ## geom_area(aes(y=bits, fill="Traffic"), color="green", alpha=0.2) +
        geom_ribbon(aes(ymin=lower, ymax=upper, fill="threshold"), alpha=0.2) +
        geom_line(aes(y=dsnsf, color='DSNSF')) +
        ggtitle(paste(unit, "per second traffic of", date, "and generated DSNSF")) +
        scale_fill_manual(name='', values=c('threshold'='green')) +
        scale_color_manual(name='', values=c('traffic'='green', 'DSNSF'='red')) +
        scale_x_continuous("time", expand=c(0.005,0.005),
                           breaks=t_intervals,
                           labels=t_labels) +
        scale_y_continuous(paste(unit, "/s", sep="")) +
        theme_bw() +
        theme(legend.justification=c(0,0), legend.position=c(0,0.8),
              legend.direction="horizontal", legend.box="horizontal",
              legend.background=element_rect(fill=alpha('white', 0.1)),
              legend.text=element_text(size=20),
              axis.text.x=element_text(size=20),
              axis.text.y=element_text(size=20),
              axis.title.x=element_text(size=20),
              axis.title.y=element_text(size=20),
              plot.title=element_text(size=22))

    return(p)
}
