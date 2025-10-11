	.data
	Hello db "Hello, World!",0
	.code
start:
	invoke Stdout, addr Hello
	inovke ExitProcess,0
end start
