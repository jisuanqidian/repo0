# system
setenv PLATFORM LINUX64

# Colors!
set     red="%{\033[1;31m%}"
set   green="%{\033[0;32m%}"
set  yellow="%{\033[1;33m%}"
set    blue="%{\033[1;34m%}"
set magenta="%{\033[1;35m%}"
set    cyan="%{\033[1;36m%}"
set   white="%{\033[0;37m%}"
set    pend="%{\033[0m%}" # This is needed at the end... :(

# There is no need to diffrential root or user
#set prompt="${green}%n${red}@${magenta}%m: ${blue}%~ ${white}%%${pend} "
#set prompt="\n         (\\_/)\n         (*_*)\n${cyan}%n${white}/> >\\${red}@${magenta}%m:${blue}%c${white}%%${pend} "
set prompt="\n         ／＞　　フ\n　　　　| 　 　  ヽ\n　　　　| 　_　 _ |\n　　　　| 　 　   |\n　 　　／\  ミ＿xノミ\n 　　 /　　　 　 |\n　　 /　 ヽ　　 ﾉ\n　　| 　　|　|　|\n／￣|　　 |　|　|\n| (￣ヽ＿_ヽ_)__)\n＼二つ${cyan}%n${white}${red}@${magenta}%m:${blue}%c${white}%%${pend} "

# Clean up after ourselves...
unset red green yellow blue magenta cyan yellow white pend


# ls color
setenv LSCOLORS ExGxFxdxCxegedabagExEx
setenv CLICOLOR yes

# grep color
setenv GREP_OPTIONS --color=auto

# auto complete
set autolist = ambiguous
set complete = enhance

# make entries autocomplete
complete make \
    'n/-f/f/' \
    'c/*=/f/' \
    'n@*@`cat -s GNUmakefile Makefile makefile usr.mk|& sed -n -e "/No such file/d" -e "/^[^     #].*:/s/:.*//p"`@'

# auto correction
set correct = cmd

# auto setup ssh client may not required
alias ssh_config 'eval `ssh-agent` && ssh-add ~/.ssh/ssh_cygnus'

# set locale
alias setlocale-zhcn 'setenv LC_ALL zh_CN.UTF-8 && setenv LANG zh_CN.UTF-8'
alias setlocale-enus 'setenv LC_ALL en_US.UTF-8 && setenv LANG en_US.UTF-8'
alias setlocale-c    'setenv LC_ALL C'

# safety measure
alias rm    'rm -i'
alias del   'rm -r'
alias mv    'mv -i'
alias cp    'cp -i'

# alias
alias la    'ls -a'
alias ll    'ls -h -l'
alias lr    'ls -R'
alias dh    'df -h -a -T'
alias ds    'du -sh'

setlocale-enus

# sublime environment
setenv LC_CTYPE "en_US.UTF-8"


# load user installed apps
setenv TOOLS "/global/tools"
setenv FREEWARE "${TOOLS}/freeware"

# load xilinx
module load vivado/2020.2
# load synopsys software
#module load spyglass/O-2018.09-SP2-11
module load syn/R-2020.09-SP1
module load vcs/O-2018.09_p
#module load verdi/O-2018.09_p
module load verdi/S-2021.09-SP2-3_P
#module load verdi/R-2020.12
#module load vc_static/R-2020.12-1
# load cadence software
module load xcelium/21.09.s005_P
module load vmanager/22.09.001_P
module load scl/2020.06
# load thrid party software
module load sublime/sublime_text_3
module load tkdiff/5.2

# load lint cdc rdc
# module load AscentLint/2019.A.P20.2021.06.14
# module load MeridianCDC/2019.A.P17.2021.06.08
# module load MeridianRDC/2019.A.P16.RDC.2021.06.03

 #load matlab
 module load matlab/r2020b

 #load repo git python
 module load git/2.33.0
 module load git-repo/2.15
 module load Python/2.7.17

# load lint cdc rdc
# module load AscentLint/2019.A.P18.2021.04.13
# module load MeridianCDC/2019.A.P16.2021.05.05
# module load MeridianRDC/2019.A.P15.RDC.2021.05.10
# this is required by verdi 
#setenv LD_LIBRARY_PATH "/usr/lib64:${VERDI_HOME}/share/PLI/VCS/linux64"
#setenv LD_LIBRARY_PATH "/global/tools/synopsys/verdi/O-2018.09/share/PLI/VCS/linux64"
# Configure your workspace home path
setenv USR_WS		"/remote/project/everest/user/${USER}"
# Configure your current workng SOC path, required by development env (MUST)
# setenv SOC_PATH		"${USR_WS}/asic/database/trunk/soc"
#setenv SOC_PATH     "${USR_WS}/everest_v100r001_ws0_trunk/database/soc"
#setenv HW           "${SOC_PATH}/hw"
#setenv XML          "${HW}/xml"
# setenv SOC_PATH		"/remote/homes/${USER}/workshop/asic/database/trunk/soc"
# SVN alias
#setenv SVNROOT		"svn://172.16.50.24/asic"
setenv SVNROOT		"svn://172.16.144.90/asic"

setenv XIN100_R2A_RTL_ROOT "/remote/project/everest/user/ninghechuan/LTE/LTE_jiaofu/ASIC/code/hdl_protect/hdl_protect"
#setenv NOVAS_HOME ${VERDI_HOME}

# User alias
#alias cd	'cd \!* ; ll'
alias subl	        'sublime_text'
alias du	        'du -h'
alias df	        'df -h'
alias gv            'gvim --remote-tab-silent'
alias xv            'vimx'
alias firefox       '/usr/bin/firefox &'
#alias svn-clean     "svn st | grep '^?' | awk '{print $2}' | xargs rm -rf"
#alias alint_rules_mannual 'kchmviewer /global/tools/realintent/AscentLint/Ascent/Lint/doc/chm/AscentLint.chm &'

alias g             'gvim'
alias clr           'clear'
alias .             'pwd'
alias ..            'cd ..'
alias ...           'cd ..;cd ..'
alias -             'cd -'
alias ~             'cd ~'
#alias lqc           'cd /remote/project/everest/user/liqiaochu/'
alias lqc           'cd /project/everest2/user/liqiaochu'
alias lqcsky        'cd /project/sky/user/liqiaochu'
alias lqcsdr        'cd /project/sdr/user/liqiaochu'
alias da            'cd /project/everest2/user/liqiaochu/everest_v200r001_ws0/database/'
#alias ram           'cd /project/everest2/user/liqiaochu/everest_v200r001_ws0/database/soc/hw/ips/digital/rxs_bwp_ram/v1'
alias ram           'cd /project/everest2/user/liqiaochu/everest_v200r001_ws0/database/ ; source cshrc_dbv1 ; cd /project/everest2/user/liqiaochu/everest_v200r001_ws0/database/soc/hw/ips/digital/rxs_bwp_ram/v1 ; source cshrc_rxs_bwp_ram_v1'
#alias main          'cd /project/everest2/user/liqiaochu/everest_v200r001_ws0/database/soc/hw/ips/digital/main_ctrl/v2'
alias main          'cd /project/everest2/user/liqiaochu/everest_v200r001_ws0/database/ ; source cshrc_dbv1 ; cd /project/everest2/user/liqiaochu/everest_v200r001_ws0/database/soc/hw/ips/digital/main_ctrl/v2 ; source cshrc_main_ctrl_v2'
alias crg           'cd /project/everest2/user/liqiaochu/everest_v200r001_ws0/database/ ; source cshrc_dbv1 ; cd /project/everest2/user/liqiaochu/everest_v200r001_ws0/database/soc/hw/chips/everest2/asic/crg_ss ; source cshrc_everest2_crg_ss'
alias dff           'cd /project/everest2/user/liqiaochu/everest_v200r001_ws0/database/ ; source cshrc_dbv1 ; cd /project/everest2/user/liqiaochu/everest_v200r001_ws0/database/soc/hw/ips/digital/rx_dff_wrap/v1 ; source cshrc_rx_dff_wrap_v1'
alias mesc          'cd /project/everest2/user/liqiaochu/everest_v200r001_ws0/database/ ; source cshrc_dbv1 ; cd /project/everest2/user/liqiaochu/everest_v200r001_ws0/database/soc/hw/ips/digital/rx_mesc_wrap/v1 ; source cshrc_rx_mesc_wrap_v1'
#alias meas          'cd /project/sky/user/liqiaochu/sky_v100r001_ws0/database/ ; source cshrc_dbv1 ; cd /project/sky/user/liqiaochu/sky_v100r001_ws0/database/soc/hw/ips/digital/rx_mesc_wrap/v1 ; source cshrc_rx_mesc_wrap_v1'
alias bfm           'cd /remote/project/everest/user/liqiaochu/everest_v200r001_ws0/database/soc/hw/bfms/sv'
alias vcs           'vcs -sverilog'
alias algo          'cd /project/everest2/asic_tv/rx_mesc/'
alias rxd           'cd /project/everest2/user/liqiaochu/everest_v200r001_ws0/database/soc/hw/ips/digital/rxd_mesc/v1/rtl'
alias rxc           'cd /project/everest2/user/liqiaochu/everest_v200r001_ws0/database/soc/hw/ips/digital/rxc_mesc/v1/rtl'
alias rxp           'cd /project/everest2/user/liqiaochu/everest_v200r001_ws0/database/soc/hw/ips/digital/rxp_cppe/v1/rtl'
alias rx            'cd /project/everest2/user/liqiaochu/everest_v200r001_ws0/database/soc/hw/ips/digital/rx_mesc/v1/rtl'
alias rxpsky        'cd /project/sky/user/liqiaochu/sky_v100r001_ws0/database/ ; source cshrc_dbv1 ; cd /project/sky/user/liqiaochu/sky_v100r001_ws0/database/soc/hw/ips/digital/rxp_meas/v1 ; source cshrc_rxp_meas_v1 ; set MODULE_NAME = rxp_meas_'
alias rxpgit        'cd /project/sky/user/liqiaochu/sky_dev/database/ ; source cshrc_dbv1 ; cd /project/sky/user/liqiaochu/sky_dev/database/soc/hw/ips/digital/rxp_meas/v1 ; source cshrc_rxp_meas_v1 ; set MODULE_NAME = rxp_meas_'
alias rxpvcs        'cd /project/sky/user/liqiaochu/sky_vcs/database/ ; source cshrc_dbv1 ; cd /project/sky/user/liqiaochu/sky_vcs/database/soc/hw/ips/digital/rxp_meas/v1 ; source cshrc_rxp_meas_v1 ; set MODULE_NAME = rxp_meas_'
alias rxpxrun       'cd /project/sky/user/liqiaochu/sky_xrun/database/ ; source cshrc_dbv1 ; cd /project/sky/user/liqiaochu/sky_xrun/database/soc/hw/ips/digital/rxp_meas/v1 ; source cshrc_rxp_meas_v1 ; set MODULE_NAME = rxp_meas_'
alias rxp100        'cd /project/sky/user/liqiaochu/sky_freeze/database/ ; source cshrc_dbv1 ; cd /project/sky/user/liqiaochu/sky_freeze/database/soc/hw/ips/digital/rxp_meas/v1 ; source cshrc_rxp_meas_v1 ; set MODULE_NAME = rxp_meas_'
alias meas          'cd /project/sky/user/liqiaochu/sky_v100r001_ws0/database/ ; source cshrc_dbv1 ; cd /project/sky/user/liqiaochu/sky_v100r001_ws0/database/soc/hw/ips/digital/rx_meas/v1 ; source cshrc_rx_meas_v1 ; set MODULE_NAME = rx_meas_'
alias measgit       'cd /project/sky/user/liqiaochu/sky_dev/database/ ; source cshrc_dbv1 ; cd /project/sky/user/liqiaochu/sky_dev/database/soc/hw/ips/digital/rx_meas/v1 ; source cshrc_rx_meas_v1 ; set MODULE_NAME = rx_meas_'

alias mainsky       'cd /project/sky/user/liqiaochu/sky_v100r001_ws0/database/ ; source cshrc_dbv1 ; cd /project/sky/user/liqiaochu/sky_v100r001_ws0/database/soc/hw/ips/digital/main_ctrl/v3 ; source cshrc_main_ctrl_v3 ; set MODULE_NAME = main_ctrl_'
alias mainsdr       'cd /project/sdr/user/liqiaochu/sdr_v1/database/ ; source cshrc_dbv1 ; cd /project/sdr/user/liqiaochu/sdr_v1/database/soc/hw/ips/digital/bb_ctrl/v2 ; source cshrc_bb_ctrl_v2 ; set MODULE_NAME = mc_'
alias mainxs        'cd /project/sdr/user/liqiaochu/xs/database/ ; source cshrc_dbv1 ; cd /project/sdr/user/liqiaochu/xs/database/soc/hw/ips/digital/bb_ctrl/v3 ; source cshrc_bb_ctrl_v3 ; set MODULE_NAME = mc_'

alias mescup        'cd $IPS/digital/rxd_mesc/v1/rtl;.;svn up;cd $IPS/digital/rxc_mesc/v1/rtl;.;svn up;cd $IPS/digital/rxp_cppe/v1/rtl;.;svn up;cd $IPS/digital/rx_mesc/v1/rtl;.;svn up;cd $RTL;.;svn up;'

#alias bsub          'bsub -q interactive -I'
alias bsb           'bsub -q interactive -I'
alias xsb           'bsub -q interactive -I xrun -64bit +access+rwc '
alias xsd           'bsub -q interactive -I xrun -64bit +access+rwc -seed '
alias xuvm          'bsub -q interactive -I xrun -64bit +access+rwc -uvm'
alias vsb           'bsub -q interactive -I vcs -sverilog +debug_all '
alias vr            'bsub -q interactive -I vcs -sverilog -R +debug_all '
alias vuvm          'bsub -q interactive -I vcs -sverilog -R +debug_all -ntb_opts uvm'
alias vsd           'bsub -q interactive -I vcs -sverilog -R +debug_all +ntb_random_seed '
alias wave          'bsub -q interactive -I simvision &'
alias simvision     'bsub -q interactive -I simvision &'
alias verdi         'bsub -q interactive -I verdi &'
alias imc           'bsub -q interactive -I imc &'
alias cov           'bsub -q interactive -I imc &'
alias coverage      'bsub -q interactive -I imc &'
alias matlab        'bsub -q interactive -I matlab -desktop &'

alias verdit2       'cd $VER;make runone_`printf t%06d \!:1` VERDI=1 &;cd -'
alias verdit        'cd $VER;make runone_$MODULE_NAME`printf %s \!:1`_`printf %04d \!:2` VERDI=1 &;cd -'
alias fsdb2         'cd $VER;make runone_`printf t%06d \!:1` COMPILE=1 SIM_ON=1 FSDB_DUMP=1;cd -'
alias fsdb          'cd $VER;make runone_$MODULE_NAME`printf %s \!:1`_`printf %04d \!:2` COMPILE=1 SIM_ON=1 FSDB_DUMP=1;cd -'
alias shm           'cd $VER;make runone_`printf t%06d \!:1` COMPILE=1 SIM_ON=1  SHM_DUMP=1;cd -'
alias cat2          'g $TS/`printf t%06d \!:1`/`printf t%06d \!:1`.cat'
#alias cat           'eval g $TS/$MODULE_NAME`printf %s \!:1`_`printf %04d \!:2`/$MODULE_NAME`printf %s \!:1`_`printf %04d \!:2`.cat '
unalias cat
alias sv2           'g $TS/`printf t%06d \!:1`/`printf t%06d \!:1`.sv'
alias sv            'eval g $TS/$MODULE_NAME`printf %s \!:1`_`printf %04d \!:2`/$MODULE_NAME`printf %s \!:1`_`printf %04d \!:2`.sv '
alias svh           'eval g $TS/$MODULE_NAME`printf %s \!:1`_`printf %04d \!:2`/$MODULE_NAME`printf %s \!:1`_`printf %04d \!:2`.svh '
alias comlog2       'g $SIM/`printf t%06d \!:1`/comp.log'
alias runlog2       'g $SIM/`printf t%06d \!:1`/run.log'
alias elalog2       'g $SIM/`printf t%06d \!:1`/elab.log'
alias comlog        'g $SIM/$MODULE_NAME`printf %s \!:1`_`printf %04d \!:2`/comp.log'
alias runlog        'g $SIM/$MODULE_NAME`printf %s \!:1`_`printf %04d \!:2`/run.log'
alias elalog        'g $SIM/$MODULE_NAME`printf %s \!:1`_`printf %04d \!:2`/elab.log'

alias make          'bsub -q interactive -I make'
alias rminca        'find . -type d -name "INCA_libs" -exec rm -rf {} \;'
alias rmcore        'find . -type f -name "core*" -exec rm -rf {} \;'
alias rmema         'bsub -I find -type f -name "run.log*" -exec sed -i "/EMA/d" {} + ; bsub -I find -type f -name "bsub.log" -exec sed -i "/EMA/d" {} +'

alias pth           'python3'
alias py            'python3'

alias fullram       'cd $SYS_TOP;make run_regress CAT=full BSO=1;cd -'
alias fullmain      'cd $SYS_TOP;make run_regress CAT=full BSO=1;cd -'
alias covmain       'cd $SYS_TOP;make run_regress CAT=full CCOV=1;make run_mimc CAT=full;cd -'

alias rui           'cd $HW/ips/digital/rxd_meas/v1/rtl; echo updating ................................................................rxd_meas; git pull origin master; cd $HW/ips/digital/rxc_meas/v1/rtl; echo updating ................................................................rxc_meas; git pull origin master; cd $HW/ips/digital/rxp_meas/v1/rtl; echo updating ................................................................rxp_meas; git pull origin master; cd $HW/ips/digital/rx_meas_share/v1/rtl; echo updating ...........................................................rx_meas_share; git pull origin master; cd $RTL; echo updating .................................................................rx_meas; git pull origin master'

alias algo          'cd $SOC_PATH/models/hw'

alias rxpup         'svn up /project/sky/user/liqiaochu/sky_v100r001_ws0/database/soc/hw/ips/digital/bfxp_fmt_wrap/v1/rtl/; svn up /project/sky/user/liqiaochu/sky_v100r001_ws0/database/soc/hw/ips/digital/cpfp_conv/v1/rtl/; svn up /project/sky/user/liqiaochu/sky_v100r001_ws0/database/soc/hw/ips/digital/fxp_mult/v1/rtl/; svn up /project/sky/user/liqiaochu/sky_v100r001_ws0/database/soc/hw/ips/digital/setmantexp/v1/rtl/; svn up /project/sky/user/liqiaochu/sky_v100r001_ws0/database/soc/hw/ips/digital/setflap_fxp/v1/rtl/; svn up /project/sky/user/liqiaochu/sky_v100r001_ws0/database/soc/hw/ips/digital/soc_ip_common/v2/rtl/; svn up /project/sky/user/liqiaochu/sky_v100r001_ws0/database/soc/hw/lib/mem/sky/fifo_wrap_dual_rail/; svn up /project/sky/user/liqiaochu/sky_v100r001_ws0/database/soc/hw/lib/mem/sky/mem_wrap_dual_rail/; svn up /project/sky/user/liqiaochu/sky_v100r001_ws0/database/soc/hw/ips/digital/rx_meas/v1/rtl/; svn up /project/sky/user/liqiaochu/sky_v100r001_ws0/database/soc/hw/ips/digital/rxp_meas/v1/rtl/; svn up /project/sky/user/liqiaochu/sky_v100r001_ws0/database/soc/hw/lib/mem/sky/mem_model/; svn up /project/sky/user/liqiaochu/sky_v100r001_ws0/database/soc/hw/lib/mem/sky/mem_syn/; svn up /project/sky/user/liqiaochu/sky_v100r001_ws0/database/soc/hw/ips/digital/axi_conv/v4/rtl/; svn up /project/sky/user/liqiaochu/sky_v100r001_ws0/database/soc/hw/ips/digital/chlsky_dec_seq/v1/rtl; svn up /project/sky/user/liqiaochu/sky_v100r001_ws0/database/soc/hw/ips/digital/cpfp_add/v1/rtl; svn up /project/sky/user/liqiaochu/sky_v100r001_ws0/database/soc/hw/ips/digital/cpfp_mult_wrapper/v1/rtl; svn up /project/sky/user/liqiaochu/sky_v100r001_ws0/database/soc/hw/ips/digital/fpfp_add/v1/rtl; svn up /project/sky/user/liqiaochu/sky_v100r001_ws0/database/soc/hw/ips/digital/fpfp_mult/v1/rtl; svn up /project/sky/user/liqiaochu/sky_v100r001_ws0/database/soc/hw/ips/digital/fpfp_remainder_div_seq/v1/rtl; svn up /project/sky/user/liqiaochu/sky_v100r001_ws0/database/soc/hw/ips/digital/fxp_cmpy/v1/rtl; svn up /project/sky/user/liqiaochu/sky_v100r001_ws0/database/soc/hw/ips/digital/invlog10_seq/v1/rtl; svn up /project/sky/user/liqiaochu/sky_v100r001_ws0/database/soc/hw/ips/digital/invlog2_seq/v1/rtl; svn up /project/sky/user/liqiaochu/sky_v100r001_ws0/database/soc/hw/ips/digital/log10_fpfp_seq/v1/rtl; svn up /project/sky/user/liqiaochu/sky_v100r001_ws0/database/soc/hw/ips/digital/polar_dec_cordic/v1/rtl; svn up /project/sky/user/liqiaochu/sky_v100r001_ws0/database/soc/hw/ips/digital/remainder_div_seq/v1/rtl; svn up /project/sky/user/liqiaochu/sky_v100r001_ws0/database/soc/hw/ips/digital/rot_cordic/v1/rtl; svn up /project/sky/user/liqiaochu/sky_v100r001_ws0/database/soc/hw/ips/digital/rsqrt_fpfp_pip/v1/rtl; svn up /project/sky/user/liqiaochu/sky_v100r001_ws0/database/soc/hw/ips/digital/rsqrt_fpfp_seq/v1/rtl;'

alias ST            'cd /project/sky/user/liqiaochu/sky_ST_R0007/database/ ; source cshrc_dbv1 ; cd /project/sky/user/liqiaochu/sky_ST_R0007/database/soc/hw/ips/digital/bb_phy/v2/ ; source cshrc_bb_phy_v2 ; set MODULE_NAME = bb_phy_'
alias measgit       'cd /project/sky/user/liqiaochu/sky_dev/database/ ; source cshrc_dbv1 ; cd /project/sky/user/liqiaochu/sky_dev/database/soc/hw/ips/digital/rx_meas/v1 ; source cshrc_rx_meas_v1 ; set MODULE_NAME = rx_meas_'
alias measxrun      'cd /project/sky/user/liqiaochu/sky_xrun/database/ ; source cshrc_dbv1 ; cd /project/sky/user/liqiaochu/sky_xrun/database/soc/hw/ips/digital/rx_meas/v1 ; source cshrc_rx_meas_v1 ; set MODULE_NAME = rx_meas_'
alias meas100       'cd /project/sky/user/liqiaochu/sky_freeze/database/ ; source cshrc_dbv1 ; cd /project/sky/user/liqiaochu/sky_freeze/database/soc/hw/ips/digital/rx_meas/v1 ; source cshrc_rx_meas_v1 ; set MODULE_NAME = rx_meas_'
alias st17          'cd /project/sky/user/liqiaochu/sky_ST_R0017/database/ ; source cshrc_dbv1 ; cd /project/sky/user/liqiaochu/sky_ST_R0017/database/soc/hw/ips/digital/bb_phy/v2 ; source cshrc_bb_phy_v2 ; set MODULE_NAME = bb_phy_'
alias stm           'cd /project/sky/user/liqiaochu/sky_ST_master/database/ ; source cshrc_dbv1 ; cd /project/sky/user/liqiaochu/sky_ST_master/database/soc/hw/ips/digital/bb_phy/v2 ; source cshrc_bb_phy_v2 ; set MODULE_NAME = bb_phy_'

alias run           'cd $SYS_TOP;xsim "base_test/$MODULE_NAME`printf %s \!:1`_`printf %04d \!:2`" --out_dir=sims;cd -'
alias runfsdb       'cd $SYS_TOP;xsim "base_test/$MODULE_NAME`printf %s \!:1`_`printf %04d \!:2`" --out_dir=sims --sim_opts="+dumpon";cd -'
alias run_verdi     '$WORKPATH/verify/bin/run_verdi'
alias mgcov         'find regress/ -name "*.vdb" | xargs bsub -I urg -full64 -dbname merged.vdb -format both -dir'
alias opcov         'bsub -I verdi -cov -covdir merged.vdb &'

alias bwpfft        'cd /project/sdr/user/liqiaochu/sdr_v1/database;source cshrc_dbv1;cd /project/sdr/user/liqiaochu/sdr_v1/database/soc/hw/ips/digital/rx_bwp_fft/v3;source cshrc_rx_bwp_fft_v3;set MODULE_NAME = rx_bwp_fft_'

limit coredumpsize 0
