#To run this makefile please type the "make" command#

all:	vendingmachinea.vbe \
	vendingmachinej.vbe \
	vendingmachinem.vbe \
	vendingmachineo.vbe \
	vendingmachiner.vbe \
	syf \
	vendingmachinea_o.vbe \
	vendingmachinej_o.vbe \
	vendingmachinem_o.vbe \
	vendingmachiner_o.vbe \
	vendingmachineo_o.vbe \
	boom \
	vendingmachinea_o.vst \
	vendingmachinej_o.vst \
	vendingmachinem_o.vst \
	vendingmachiner_o.vst \
	vendingmachineo_o.vst \
	boog \
	vendingmachinea_l.xsc \
	vendingmachinej_l.xsc \
	vendingmachinem_l.xsc \
	vendingmachiner_l.xsc \
	vendingmachineo_l.xsc \
	loon \
	vendingmachinea_labs.vbe \
	vendingmachinej_labs.vbe \
	vendingmachinem_labs.vbe \
	vendingmachiner_labs.vbe \
	vendingmachineo_labs.vbe \
	flatbeh \
	proof \
	clean \
	credits
	@echo "-- Done, All Good --"

#----------------- [SYF] -----------------#

vendingmachinea.vbe: vendingmachine.fsm
	@echo "    Encoding Synthesis -> vendingmachinea.vbe"
	syf -CEV -a vendingmachine

vendingmachinej.vbe: vendingmachine.fsm
	@echo "    Encoding Synthesis  -> vendingmachinej.vbe"
	syf -CEV -j vendingmachine
 
vendingmachinem.vbe: vendingmachine.fsm
	@echo "    Encoding Synthesis  -> vendingmachinem.vbe"
	syf -CEV -m vendingmachine
 
vendingmachineo.vbe: vendingmachine.fsm
	@echo "    Encoding Synthesis  -> vendingmachineo.vbe"
	syf -CEV -o vendingmachine
 
vendingmachiner.vbe: vendingmachine.fsm
	@echo "    Encoding Synthesis  -> vendingmachiner.vbe"
	syf -CEV -r vendingmachine

syf:
	mkdir ./SYF
	cp *.vbe ./SYF
	cp *.enc ./SYF

#----------------- [BOOM] -----------------#

vendingmachinea_o.vbe: vendingmachinea.vbe
	@echo "[BOOM] Boolean optimizing -a -> $@"
	boom -V -d 50 vendingmachinea.vbe vendingmachinea_o.vbe > vendingmachinea.out

vendingmachinej_o.vbe: vendingmachinej.vbe
	@echo "[BOOM] Boolean optimizing -j -> $@"
	boom -V -d 50 vendingmachinej.vbe vendingmachinej_o.vbe > vendingmachinej.out

vendingmachinem_o.vbe: vendingmachinem.vbe
	@echo "[BOOM] Boolean optimizing -m -> $@"
	boom -V -d 50 vendingmachinem.vbe vendingmachinem_o.vbe > vendingmachinem.out

vendingmachineo_o.vbe: vendingmachineo.vbe
	@echo "[BOOM] Boolean optimizing -o -> $@"
	boom -V -d 50 vendingmachineo.vbe vendingmachineo_o.vbe > vendingmachineo.out

vendingmachiner_o.vbe: vendingmachiner.vbe
	@echo "[BOOM] Boolean optimizing -r -> $@"
	boom -V -d 50 vendingmachiner.vbe vendingmachiner_o.vbe > vendingmachiner.out

boom:
	mkdir ./BOOM
	cp *_o.vbe ./BOOM
	mv *.out ./BOOM

#----------------- [BOOG] -----------------#

vendingmachinea_o.vst : vendingmachinea_o.vbe
	@echo "[BOOG] Library Mapping -a -> $@ "
	boog -l paramfile vendingmachinea_o

vendingmachinej_o.vst : vendingmachinej_o.vbe
	@echo "[BOOG] Library Mapping -j -> $@ "
	boog -l paramfile vendingmachinej_o

vendingmachinem_o.vst : vendingmachinem_o.vbe
	@echo "[BOOG] Library Mapping -m -> $@ "
	boog -l paramfile vendingmachinem_o

vendingmachineo_o.vst : vendingmachineo_o.vbe
	@echo "[BOOG] Library Mapping -o -> $@ "
	boog -l paramfile vendingmachineo_o

vendingmachiner_o.vst : vendingmachiner_o.vbe
	@echo "[BOOG] Library Mapping -r -> $@ "
	boog -l paramfile vendingmachiner_o

boog:
	mkdir ./BOOG
	cp *.vst ./BOOG
	cp *.xsc ./BOOG

#----------------- [LOON] -----------------#

vendingmachinea_l.xsc : vendingmachinea_o.vst
	@echo "[LOON] Netlist optimizing -a -> $@ "
	loon vendingmachinea_o vendingmachinea_l paramfile > vendingmachinea_l.out

vendingmachinej_l.xsc : vendingmachinej_o.vst
	@echo "[LOON] Netlist optimizing -j -> $@ "
	loon vendingmachinej_o vendingmachinej_l paramfile > vendingmachinej_l.out

vendingmachinem_l.xsc : vendingmachinem_o.vst
	@echo "[LOON] Netlist optimizing -m -> $@ "
	loon vendingmachinem_o vendingmachinem_l paramfile > vendingmachinem_l.out

vendingmachineo_l.xsc : vendingmachineo_o.vst
	@echo "[LOON] Netlist optimizing -o -> $@ "
	loon vendingmachineo_o vendingmachineo_l paramfile > vendingmachineo_l.out

vendingmachiner_l.xsc : vendingmachiner_o.vst
	@echo "[LOON] Netlist optimizing -r -> $@ "
	loon vendingmachiner_o vendingmachiner_l paramfile > vendingmachiner_l.out

loon:
	mkdir ./LOON
	cp *_l.vst ./LOON
	cp *_l.xsc ./LOON
	mv *.out ./LOON

#----------------- [FLATBEH] -----------------#

vendingmachinea_labs.vbe : ./LOON/vendingmachinea_l.vst
	@echo "[FLATBEH] Netlist checking -a -> $@ "
	flatbeh vendingmachinea_l

vendingmachinej_labs.vbe : ./LOON/vendingmachinej_l.vst
	@echo "[FLATBEH] Netlist checking -j -> $@ "
	flatbeh vendingmachinej_l

vendingmachinem_labs.vbe : ./LOON/vendingmachinem_l.vst
	@echo "[FLATBEH] Netlist checking -m -> $@ "
	flatbeh vendingmachinem_l

vendingmachineo_labs.vbe : ./LOON/vendingmachineo_l.vst
	@echo "[FLATBEH] Netlist checking -o -> $@ "
	flatbeh vendingmachineo_l

vendingmachiner_labs.vbe : ./LOON/vendingmachiner_l.vst
	@echo "[FLATBEH] Netlist checking -r -> $@ "
	flatbeh vendingmachiner_l

flatbeh:
	mkdir ./FLATBEH
	cp *_labs.vbe ./FLATBEH

#----------------- [PROOF] -----------------#

proof :
	@echo "[PROOF] Netlist checking -a -> $@ "
	proof -d ./SYF/vendingmachinea ./FLATBEH/vendingmachinea_labs
	@echo "[PROOF] Netlist checking -j -> $@ "
	proof -d ./SYF/vendingmachinej ./FLATBEH/vendingmachinej_labs
	@echo "[PROOF] Netlist checking -m -> $@ "
	proof -d ./SYF/vendingmachinem ./FLATBEH/vendingmachinem_labs
	@echo "[PROOF] Netlist checking -o -> $@ "
	proof -d ./SYF/vendingmachineo ./FLATBEH/vendingmachineo_labs
	@echo "[PROOF] Netlist checking -r -> $@ "
	proof -d ./SYF/vendingmachiner ./FLATBEH/vendingmachiner_labs

#----------------- [CLEAN] -----------------#
credits:
	@echo ""
	@echo "[CREDITS]"
	@echo "Mohamed El Ghamry"
	@echo "Faculty of Engineering Student"
	@echo "Ain Shams University"
	@echo "Computer Engineering and Software Systems Department"
	@echo ""

#----------------- [CLEAN] -----------------#

clean :
	rm -f  *.vbe *.enc *.vst *.xsc *~
	@echo "Erase all the unnecessary files generated by the makefile"

delete:
	rm -rf SYF
	rm -rf BOOM
	rm -rf BOOG
	rm -rf LOON
	rm -rf FLATBEH
	@echo "Erase all the folders generated by the makefile"
