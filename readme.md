Teste git primeiros passos
teste de memória



# maximum number of open files
# don't use value upper than fs.file-max
root       soft    nofile         102400
root       hard    nofile         102400
# limits the core file size (KB)
root       soft    core            unlimited
# maximum data size (KB)
root       soft    data            unlimited
# maximum filesize (KB)
root       soft    fsize           unlimited
# maximum locked-in-memory address space (KB)
root       soft    memlock         unlimited
root       hard    memlock         unlimited
# maximum stack size (KB)
root       soft    stack           unlimited
root       hard    stack           unlimited
# maximum CPU time (minutes)
root       soft    cpu             unlimited
# maximum number of processes
root       soft    nproc           unlimited
root       hard    nproc           unlimited
# address space limit (KB)
root       soft    as              unlimited
# the priority to run user process with (negative values boost process priority)
root       soft    priority        -11
# maximum locked files (Linux 2.4 and higher)
root       soft    locks           unlimited
# maximum number of pending signals (Linux 2.6 and higher)
root       soft    sigpending      unlimited
root       hard    sigpending      unlimited
# maximum memory used by POSIX message queues (bytes) (Linux 2.6 and higher)
root       soft    msgqueue        unlimited
root       hard    msgqueue        unlimited
# maximum nice priority allowed to raise to (Linux 2.6.12 and higher) values: [-20,19]
root       soft    nice            -11
# maximum number of open files
#######
# don't use value upper than fs.file-max
asterisk       soft    nofile         102400
asterisk       hard    nofile         102400
# limits the core file size (KB)
asterisk       soft    core            unlimited
# maximum data size (KB)
asterisk       soft    data            unlimited
# maximum filesize (KB)
asterisk       soft    fsize           unlimited
# maximum locked-in-memory address space (KB)
asterisk       soft    memlock         unlimited
asterisk       hard    memlock         unlimited
# maximum resident set size (KB) (Ignored in Linux 2.4.30 and higher)
# root       soft    rss             unlimited
# maximum stack size (KB)
asterisk       soft    stack           unlimited
asterisk       hard    stack           unlimited
# maximum CPU time (minutes)
asterisk       soft    cpu             unlimited
# maximum number of processes
asterisk       soft    nproc           unlimited
asterisk       hard    nproc           unlimited
# address space limit (KB)
asterisk       soft    as              unlimited
# the priority to run user process with (negative values boost process priority)
asterisk       soft    priority        -11
# maximum locked files (Linux 2.4 and higher)
asterisk       soft    locks           unlimited
# maximum number of pending signals (Linux 2.6 and higher)
asterisk       soft    sigpending      unlimited
asterisk       hard    sigpending      unlimited
# maximum memory used by POSIX message queues (bytes) (Linux 2.6 and higher)
asterisk       soft    msgqueue        unlimited
asterisk       hard    msgqueue        unlimited
# maximum nice priority allowed to raise to (Linux 2.6.12 and higher) values: [-20,19]
asterisk       soft    nice            -11
