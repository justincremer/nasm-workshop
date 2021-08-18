NAME = hello
OUTDIR = .
TARGET = elf_i386
SIZE = elf32

# SIZE = elf64
# TARGET = elf_x86_64

main: $(NAME).o
	ld -m $(TARGET) -s -o $(OUTDIR)/main $(OUTDIR)/$(NAME).o

$(NAME).o: main.asm
	nasm -f $(SIZE) main.asm -o $(OUTDIR)/$(NAME).o

clean:
	rm $(OUTDIR)/*.o $(OUTDIR)/$(NAME)

