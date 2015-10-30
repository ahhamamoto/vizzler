# caminho para os dados de tráfego real
global.traffic_path <- "./data/traffic"

# caminho para os dados do dsnsf
global.dsnsf_path <- "./data/dsnsf"

# lista todos arquivos do diretório de dsnsf, listando assim
# todos os métodos de dsnsf
global.availableMethods <- list.files(global.dsnsf_path)

# unidades de análise disponíveis
global.units <- c("Bits" = "bits",
                  "Packets" = "packets",
                  "Flows" = "flows",
                  "IP src entropy" = "ip_src_entropy",
                  "IP dst entropy" = "ip_dst_entropy",
                  "Port src entropy" = "port_src_entropy",
                  "Port dst entropy" = "port_dst_entropy")

# protocolos disponíveis
global.protocols <- c("all", "tcp", "udp")

# métricas disponíveis
global.availableMetrics <- c("Euclidian Distance",
                             "Weighted Euclidian",
                             "Squared Euclidian",
                             "Squared-chord",
                             "Squared X^2",
                             "City Block",
                             "Minkowski",
                             "Chebyshev",
                             "Camberra",
                             "Cosine",
                             "Jaccard",
                             "Bhattacharyya",
                             "Pearson",
                             "Divergence",
                             "Mahalanobis")

# janelas de tempo de dsnsf disponíveis
global.time_windows <- c("60 sec" = 60,
                         "120 sec" = 120,
                         "180 sec" = 180,
                         "240 sec" = 240,
                         "300 sec" = 300)

# as horas disponíveis e os seus respectivos valores
global.hours <- c("00:00" = 0, "01:00" = 1, "02:00" = 2, "03:00" = 3,
                  "04:00" = 4, "05:00" = 5, "06:00" = 6, "07:00" = 7,
                  "08:00" = 8, "09:00" = 9, "10:00" = 10, "11:00" = 11,
                  "12:00" = 12, "13:00" = 13, "14:00" = 14, "15:00" = 15,
                  "16:00" = 16, "17:00" = 17, "18:00" = 18, "19:00" = 19,
                  "20:00" = 20, "21:00" = 21, "22:00" = 22, "23:00" = 23,
                  "24:00" = 24)
