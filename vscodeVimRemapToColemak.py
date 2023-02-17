now = "dg,ek,fe,gt,il,jy,kn,lu,nj,pr,rs,sd,tf,ui,yo,op,DG,EK,FE,GT,IL,JY,KN,LU,NJ,PR,RS,SD,TF,UI,YO,OP".split(",")

def printRemap():
	for char in now:
		print("\t\t{")
		print("\t\t\t\"before\":[\""+str(char[0])+"\"],")
		print("\t\t\t\"after\":[\""+str(char[1])+"\"]")
		print("\t\t},")

	print("\t\t{")
	print("\t\t\t\"before\":[\"d\",\"d\"],")
	print("\t\t\t\"after\":[\"g\",\"g\"]")
	print("\t\t},")
	print("\t\t{")
	print("\t\t\t\"before\":[\"s\",\"s\"],")
	print("\t\t\t\"after\":[\"d\",\"d\"]")
	print("\t\t},")


print("\t\"vim.normalModeKeyBindingsNonRecursive\": [")
printRemap()
print("\t],")

print("\t\"vim.visualModeKeyBindingsNonRecursive\": [")
printRemap()
print("\t]")
