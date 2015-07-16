# função que retorna o NMSE de duas séries temporais
nmse <- function(real_traffic, dsnsf) {
    value <- numeric()
    for (i in 1:length(dsnsf)) {
        value <- mean((dsnsf[i] - real_traffic[i]) ^ 2) /
                 (mean(dsnsf[i]) * mean(real_traffic[i]))
    }
    return(value)
}
