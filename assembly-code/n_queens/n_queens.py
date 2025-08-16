
def is_valid_board(board):
	# make sure where board is valid
	# make sure no queens are attacking each other

	if (len(board) != 8):
		return False 

	for i in range(len(board)):
		if (len(board[i]) != 8):
			return False

	return True
board = [	
	[0, 0, 0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0, 0, 0]
]
print(is_valid_board(board))
