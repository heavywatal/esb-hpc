+++
title = "Hardware"
menu = "main"
weight = 10
+++

## System

- Head node x1
- Compute node x4
- Switching hub: GbE 16ports
- Uninterruptible Power Supply (UPS)

## Computer

| Node    | Hostname    | CPU                    | Cores | RAM  |
| ------- | ----------- | ---------------------- | ----- | ---- |
| head    | metal       | Intel Xeon Silver 4108 | 2x8   | 96GB |
| compute | metal01--04 | Intel Xeon Gold 6126   | 2x12  | 96GB |


## Storage

| Type | Mount   | Size  | Drive | Array            |
| ---- | ------- | ----- | ----- | ---------------- |
| OS   | `/`     | 480GB | SSD   | RAID 1 (2x480GB) |
| data | `/home` | 15TB  | HDD   | RAID 6 (5x6TB)   |
