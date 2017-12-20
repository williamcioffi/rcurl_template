library(RCurl)

# url and password are in a gitignored file
url_usrpwd <- read.table("url_user_pwd", stringsAsFactors = FALSE)[, 1]

baseurl <- url_usrpwd[1]
usr_pwd <- url_usrpwd[2]

url <- paste0(baseurl, "test.csv")

x <- getURL(
	url,
	userpwd = usr_pwd,
	# dirlistonly = TRUE,
# these options are to make ftp work with box
	ftp.use.epsv = FALSE, 		# --disable-epsv
	ftp.skip.pasv.ip = TRUE, 	# --ftp-skip-pasv-ip
	ftp.ssl = TRUE				# --ftp-ssl
)

testcsv <- read.table(text = x, header = TRUE, sep = ',')


### can write x directly to file like this too
# note that the line endings may not be what you expect...

# fcon <- file("filename.csv")
# writeLines(x, fcon)
# close(fcon)

