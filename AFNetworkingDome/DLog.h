//
//  DLog.h
//  AFNetworkingDome
//
//  Created by ttlgz-0022 on 15/12/24.
//  Copyright © 2015年 Transaction Technologies Limited. All rights reserved.
//

#ifdef DEBUG
#ifndef DLog
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#endif
#else
#ifndef DLog
#define DLog(...) {}
#endif
#endif
