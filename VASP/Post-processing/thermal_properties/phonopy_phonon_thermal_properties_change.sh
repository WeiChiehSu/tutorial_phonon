#! /bin/bash                                                                                           
#PBS -N PhonopyTH
##PBS -q workq
##---------------------------------------------------------------------------------------------------
## -l select=<# of chunks>[:<ncpus=#>], how many chunks. ncpus, how many cpus for each chunk.
## chunks is the set of resources allocated, typically, there is one chunk per MPI process.
## recommend select=2:ncpus=1 for 2-rank MPI job, select=1:ncpus=2 for 2-threads openMP job.
## select=<...>:cpu=6130 or cpu=2690v4 for request the 6130 CPU nodes, E5-2690v4 CPU nodes.
## hint: if you want to use the fat node, you need specify the queue fat(adding #PBS -q fat)
##---------------------------------------------------------------------------------------------------
#PBS -l select=8:ncpus=1:mem=10gb
##---------------------------------------------------------------------------------------------------
## -l place= <type>[:<sharing>][:<group>]
## place the chunks on which way.
## vnodes is a virtual node, a abstract object representing a sub set of resources of a machine(host).
###     free,     on any vnode(s)
###     pack,     all chunks will be taken from one host
###     scatter,  only one chunk is taken from any host(means try to distribute your MPI rank to nodes)
###     vscatter, only one chunk is taken from any vnode(same as above but to vnodes)
## recommned place=pack for avoiding the hosts-crossing jobs
## place=pack:excl(exclhost) for exclusively using the vnode(node)
## a placement set will try to allocate the node for the jobs best,
## example: <...>:group=switch will arrange the vnodes(or nodes) for jobs at the same switch if possible
##---------------------------------------------------------------------------------------------------
#PBS -l place=pack:group=switch
##---------------------------------------------------------------------------------------------------

# PBSpro will set the thread of openMP to `ncpus', make it 1 in case you used the option         
# kind of -l select=1:ncpus=10, using this usually faster in VASP.
export OMP_NUM_THREADS=1

if ! $(type module &>/dev/null) || [[ -z "$LMOD_CMD" ]]; then
    echo "The \`module' or lua mod command failed, pleae contact the administrator"
    exit
fi

cd $PBS_O_WORKDIR
echo -e "you are acquiring the resoures\n$(cat $PBS_NODEFILE)"

export PATH=/home/114514/anaconda3/bin:$PATH
echo -e "using MPI: mpiexec is \n$(type -p mpiexec)"
#np=$(cat $PBS_NODEFILE |wc -l)
KP=50

cat > mesh.conf << EOF
MP = $KP $KP $KP 
GAMMA_CENTER = .TRUE.
TPROP = .TRUE.
TMIN =0
TMAX = 1000
TSTEP = 10
EOF
 
# Print phonopy version or verify it's installed
echo -e "Using phonopy: $(type -p phonopy)"

echo "Running phonopy-load to generate thermal properties plot..."
phonopy-load --readfc --config mesh.conf -p -s

eval $run 1> >(tee ${PBS_JOBID}.${PBS_JOBNAME}.out) 2> >(tee -a ${PBS_JOBID}.${PBS_JOBNAME}.out)

echo "thermal properties done"
