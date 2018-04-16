+++
title = "Hardware"
menu = "main"
weight = 10
+++

## System

Head node
: HPC5000-XSL224R2S x1

Compute node
: HPC5000-XSL224R1S x4

Switching hub
: NETGEAR JGS516-300JPS (GbE 16ports)

Uninterruptible Power Supply (UPS)
: APC SMT1500RMJ (for head node)


## Computer

| Node    | Hostname   | CPU                    | GHz  | Cores | RAM  |
| ------- | ---------- | ---------------------- | ---- | ----- | ---- |
| head    | `metal`    | Intel Xeon Silver 4108 | 1.80 | 2x8   | 96GB |
| compute | `metal01`  | Intel Xeon Gold 6126   | 2.60 | 2x12  | 96GB |
|         | &#8942;    |                        |      |       |      |
|         | `metal04`  |                        |      |       |      |


## Storage

| Type | Mount   | Size  | Drive | Array            |
| ---- | ------- | ----- | ----- | ---------------- |
| OS   | `/`     | 480GB | SSD   | RAID 1 (2x480GB) |
| data | `/home` | 15TB  | HDD   | RAID 6 (5x6TB)   |
