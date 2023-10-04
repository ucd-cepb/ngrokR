#' Stop a live coding stream using nGrok (https://ngrok.com/)
#'
#' @param id id of the tunnel instance
#' @importFrom rstudioapi terminalKill
#' @importFrom livecode stop_all
#' @export

livestreamStop <- function(id = NULL){
  terminalKill(id = id)
  stop_all()
}

