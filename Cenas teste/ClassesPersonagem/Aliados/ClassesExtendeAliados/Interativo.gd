class_name Interativo
extends Aliados

# CLASSE SUPER ABSTRATA AINDA ( TEM COISAS A SE PENSAR EM COMO FAZER )
# NAO PUS DIALOGO POR QUE ACHO QUE INICIA_DIALOGO JA FAZ O PAPEL QUE DIALOGO FARIA
# TENDO UMA FUNCAO A MENOS ( MAS TEM QUE VER COMO O MATHEUS PENSA )
var missao_disponivel : bool
var dialogo_disponivel : Array[int]

# Essa funcao vai servir para podemos inicializar o dialog
# Recebera como parametro o dialogo que queremos da hash??????????
func iniciar_dialogo() -> void:
	# Aqui tera o codigo para buscar na hash-table o dialogo e mostrar na tela
	pass

func iniciar_missao() -> void:
	# Entra o codigo de fazer a missao, ela vai ter que mandar para missoesCompletas() true quando acabar
	# missoesCompletas da classe aliado
	pass
