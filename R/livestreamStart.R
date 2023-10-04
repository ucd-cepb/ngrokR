#' Initiate a live coding stream using nGrok (https://ngrok.com/)
#'
#' @param username character string username used to access live stream
#' @param password character string password used to access live stream
#' @param hostname webpage (as character string) to host the live stream
#' @param port default is 4040. what web port to use (https://ngrok.com/docs/secure-tunnels/ngrok-agent/web-inspection-interface/)
#' @export
#' @return id value of tunnel that can be used to shut down the tunnel later
#' @details NOTE: this package assumes that you have followed the steps to install nGrok on your computer (https://ngrok.com/docs/getting-started/ also https://bitsandbricks.github.io/post/code-live-from-rstudio-and-share-it-with-the-world-in-real-time/. For troubleshooting install, see https://stackoverflow.com/questions/65251887/clang-7-error-linker-command-failed-with-exit-code-1-for-macos-big-sur/65334247#65334247.
#' @importFrom livecode serve_file
#' @importFrom rstudioapi terminalExecute

livestreamStart = function(hostname = NULL,username = NULL,password = NULL,port = 4040){
  if(missing(hostname)){stop('Please specify a hostname')}
  if(missing(username)){stop('Please specify a username')}
  if(missing(password)){stop('Please specify a password')}
  #for(i in packs){if(!require(i,character.only = T)){install.packages(i);require(i,character.only = T)}}
  #if(!require('livecode')){remotes::install_github('rundel/livecode');require(livecode)}
  #start livecode local server (available only on LAN)
  s <- serve_file(port = port,open_browser = F)
  url = s$url
  #adding -bind-tls=true makes https, but for some reason people just then get a blank white screen
  command = paste0("ngrok http -hostname=",hostname," -auth='",username,"':'",password,"' ",url)
  terminal_id = terminalExecute(command)
  id = terminalExecute('R --version',show = F)
  return(id)
}
