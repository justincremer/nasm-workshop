NAME = numbers
ENTRY = src/main.s
OUTDIR = bin
SIZE = elf32
TARGET = elf_i386

# SIZE = elf64
# TARGET = elf_x86_64

main: $(NAME).o
	ld -m $(TARGET) -s -o $(OUTDIR)/$(NAME) $(OUTDIR)/$(NAME).o

$(NAME).o: $(ENTRY)
	nasm -f $(SIZE) $(ENTRY) -o $(OUTDIR)/$(NAME).o

clean:
	rm $(OUTDIR)/*.o $(OUTDIR)/$(NAME)

