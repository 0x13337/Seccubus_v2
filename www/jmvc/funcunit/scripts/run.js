// used to 'run' a funcunit/envjs command:
load(java.lang.System.getProperty("basepath")+"../steal/rhino/utils.js")
load('steal/rhino/rhino.js');
load('funcunit/loader.js');
FuncUnit.load(_args.shift())