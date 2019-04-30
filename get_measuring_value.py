#!/usr/bin/python2
import cpuinfo

def cpumodel(args):
    return cpuinfo.get_cpu_info()['brand']

def testline(args):
    return "1234567890123456789012345678901234567890"
