NAME = hello
OUTFILE = .

main: $(NAME).o
	ld -m elf_i386 -s -o $(OUTFILE)/$(NAME) $(OUTFILE)/$(NAME).o

$(NAME).o: main.asm
	nasm -f elf main.asm -o $(OUTFILE)/$(NAME).o

clean:
	rm $(OUTFILE)/*.o $(OUTFILE)/$(NAME)

