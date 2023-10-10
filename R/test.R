library(livecode)
devtools::install_github('rundel/livecode')
hostname = 'www.rdaviscode.com'
username = 'rdavis'
password = 'geoducks'
port = 4040
s <- serve_file(port = port,open_browser = F)
url = s$url
#adding -bind-tls=true makes https, but for some reason people just then get a blank white screen
command = paste0("ngrok http -hostname=",hostname," -auth='",username,"':'",password,"' ",url)
terminal_id = terminalExecute(command)
id = terminalExecute('R --version',show = F)
