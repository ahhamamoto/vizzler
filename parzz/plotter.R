plot_box <- function(input) {
    cor_plot <- ggplot(input, aes(factor(probability), correlation, color=probability)) +
                geom_boxplot() +
                scale_x_discrete("Mutation Probability (%)") +
                scale_y_continuous("Correlation") +
                ggtitle("Boxplot of correlation in terms of probability") +
                theme_bw() +
                theme(legend.position="none")
    ggsave(file="img/cor_boxplot.png", width=15, height=6)

    nmse_plot <- ggplot(input, aes(factor(probability), nmse)) +
                 geom_boxplot() +
                 scale_x_discrete("Mutation Probability (%)") +
                 scale_y_continuous("Correlation") +
                 ggtitle("Boxplot of correlation in terms of probability") +
                 theme_bw()
    ggsave(file="img/nmse_boxplot.png", width=15, height=6)
}
