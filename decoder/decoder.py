from helpers import intToBinary, loadInsDict, loadInsFile, loadInsTypes, saveFile

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
	try:
		data = loadInsFile("../mips/algorithm.mips")

		# remove spaces, comas and dollar characters
		assemblerIns = []
		for i in data:
			i = i.strip().replace(',', '')
			i = i.strip().replace('$', '')
			assemblerIns.append( i.strip().split(' ') )

		# convert assembler to binary
		preMachineIns = []
		for i in assemblerIns:
			preMachineIns.append( toMachineCode( i, INS_FORMAT[ i[0] ] ) )


		# final format in 8bits words
		machineIns = []
		for i in preMachineIns:
			machineIns.append( i[0:8] )
			machineIns.append( i[8:16] )
			machineIns.append( i[16:24] )
			machineIns.append( i[24:] )

		saveFile( "../mem/ins_c.mem", machineIns )

	except Exception as e:
		print( e )

	# print( *machineIns, sep="\n" )

decodeMIPS()
