from gtts import gTTS 

import os 


mytext = input("\n\n\tType Your message : ")


file = mytext.replace(" ", "_")



language = input("\tSelext language(en/ml) : ")

 

myobj = gTTS(text=mytext, lang=language, slow=False) 

  

myobj.save(file + ".mp3")


os.system("mpg123 " + file + ".mp3")


print ("\033[91m")

msg = " \033[91m \033[1m The file has been saved to \033[92m music/ttsVoice \033[91m in Your Directory"

len = len(msg)

print ( '+' + '-'*(len-16) + '+')
print ('| %-*.*s |' % (len,len,msg))
print ( '+' + '-'*(len-16) + '+')

print ("\033[0m")
