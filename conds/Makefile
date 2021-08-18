NAME = conds
ENTRY = src/main.s
OUTDIR = bin

ASSEMBLER = nasm
LINKER = ld
CC = gcc

ARCH = elf_i386
TARGET = elf32

main: $(NAME).o
	$(LINKER) -m $(ARCH) -s -o $(OUTDIR)/main $(OUTDIR)/$(NAME).o

$(NAME).o: $(ENTRY)
	$(ASSEMBLER) -f $(TARGET) $(ENTRY) -o $(OUTDIR)/$(NAME).o

clean:
	rm $(OUTDIR)/*.o $(OUTDIR)/$(NAME)

