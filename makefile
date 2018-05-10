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
	vendingmachineo_labs.vbe \
	flatbeh \
	proof \
	scapin \
	ocp \
	nero \
	cougar \
	s2r \
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

vendingmachineo_labs.vbe : ./LOON/vendingmachineo_l.vst
	@echo "[FLATBEH] Netlist checking -o -> $@ "
	flatbeh vendingmachineo_l

flatbeh:
	mkdir ./FLATBEH
	cp *_labs.vbe ./FLATBEH

#----------------- [PROOF] -----------------#

proof :
	@echo "[PROOF] Netlist checking -o -> $@ "
	proof -d ./SYF/vendingmachineo ./FLATBEH/vendingmachineo_labs

#----------------- [SCAPIN] -----------------#

scapin:	./LOON/vendingmachineo_l.vst
	@echo "[SCAPIN] Scan-path insertion (DFT) $@ "
	scapin -VRB -P sxlib.scapin vendingmachineo_l pathfile vendingmachineo_s
	mkdir ./SCAPIN
	cp *_s.vst ./SCAPIN

#----------------- [OCP] -----------------#

ocp:	./SCAPIN/vendingmachineo_s.vst
	@echo "[OCP] Placement $@ "
	alliance-ocp -v -ring -ioc pinorder vendingmachineo_s vendingmachineo_ocp > vendingmachineo_ocp.out
	mkdir ./OCP
	cp *.ap ./OCP
	mv *.out ./OCP

#----------------- [NERO] -----------------#

nero:	./OCP/vendingmachineo_ocp.ap ./SCAPIN/vendingmachineo_s.vst
	@echo "[NERO] Routing $@ "
	nero -V -p vendingmachineo_ocp vendingmachineo_s vendingmachineo_s > vendingmachineo_nero.out
	mkdir ./NERO
	cp *_s.ap ./NERO
	mv *_nero.out ./NERO

#----------------- [COUGAR] -----------------#

cougar:	./NERO/vendingmachineo_s.ap ./SCAPIN/vendingmachineo_s.vst
	@echo "[COUGAR] Netlist extraction $@ "
	MBK_OUT_LO=al; export MBK_OUT_LO; \
	RDS_TECHNO_NAME=./techno/techno-035.rds; \
	export RDS_TECHNO_NAME; \
	cougar -v vendingmachineo_s vendingmachineo_cougar > vendingmachineo_cougar.out
	@echo "[LVX] Netlist comparison $@ "
	lvx vst al vendingmachineo_s vendingmachineo_cougar -f > vendingmachineo_lvx.out
	mkdir ./COUGAR
	mv *.al ./COUGAR
	mv *_cougar.out ./COUGAR
	mkdir ./LVX
	mv *_lvx.out ./LVX

#----------------- [S2R] -----------------#
s2r:	./NERO/vendingmachineo_s.ap
	@echo "[S2R] Symbolic to real conversion $@ "
	s2r -v -r vendingmachineo_s > vendingmachineo_s2r.out
	mkdir ./S2R
	mv *_s2r.out ./S2R
	mv *.cif ./S2R

#----------------- [CREDITS] -----------------#
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
	rm -f  *.vbe *.enc *.vst *.xsc *.ap *.out *.al *.cif *~
	@echo "Erase all the unnecessary files generated by the makefile"

delete:
	rm -rf SYF
	rm -rf BOOM
	rm -rf BOOG
	rm -rf LOON
	rm -rf FLATBEH
	rm -rf SCAPIN
	rm -rf OCP
	rm -rf NERO
	rm -rf COUGAR
	rm -rf LVX
	rm -rf S2R
	@echo "Erase all the folders generated by the makefile"
