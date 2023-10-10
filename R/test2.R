library(ngrokR)
id <- ngrokR::livestreamStart(hostname = 'www.rdaviscode.com','rdavis','geoducks')

ngrokR::livestreamStop()
hostname = 'www.rdaviscode.com'
username = 'rdavis'
password = 'geoducks'
port = 4040

library(livecode)
s <- livecode::serve_file(bitly = T)
s <- livecode::serve_file(port = port,open_browser = F)
url = s$url

paste0("ngrok http -hostname=",hostname," -auth='",username,"':'",password,"' ",url)
