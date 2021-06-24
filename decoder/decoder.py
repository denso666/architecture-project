from helpers import intToBinary, loadInsDict, loadInsFile, loadInsTypes

INS_FORMAT = loadInsDict()
INS_TYPES = loadInsTypes()

def toMachineCode( ins, format ):
	
	binaryIns = ""

	# R type
	if ins[0] in INS_TYPES['R']:
		binaryIns += format["code"]

		index = 1
		for n in format["sections"]:
			binaryIns += intToBinary( ins[index], n )
			index += 1
		
		binaryIns += "00000"+format['rcode']
	
	# I type
	elif ins[0] in INS_TYPES['I']:
		binaryIns += format["code"]

		index = 1
		for n in format["sections"]:
			binaryIns += intToBinary( ins[index], n )
			index += 1

	# J type
	elif ins[0] in INS_TYPES['J']:
		binaryIns += format["code"]
		binaryIns += intToBinary( ins[1], format["sections"][0] )

	return binaryIns



def decodeMIPS():
	data = loadInsFile("../mips/algorithm.mips")


	# remove spaces, comas and dollars characters
	preMachineIns = []
	for i in data:
		i = i.strip().replace(',', '')
		i = i.strip().replace('$', '')
		preMachineIns.append( i.strip().split(' ') )

	# convert assembler to binary
	machineIns = []
	for i in preMachineIns:
		machineIns.append( toMachineCode( i, INS_FORMAT[ i[0] ] ) )

	print( *machineIns, sep="\n" )




decodeMIPS()