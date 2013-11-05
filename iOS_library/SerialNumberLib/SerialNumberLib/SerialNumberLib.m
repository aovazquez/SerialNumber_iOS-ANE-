//  SerialNumberLib
//
//  Created by Angel Vazquez on 20/08/13.
//  Copyright (c) 2013 Angel Vazquez. All rights reserved.
//

#import "FlashRuntimeExtensions.h"
#import "serialLib.h"

FREContext eventContext;

FREObject getSerial(FREContext ctx, void* funcData, uint32_t argc,FREObject argv[])
{
    UIDevice *device = [[UIDevice alloc] init];
    NSString *val = [device serialNumber];
    
    
    NSString *serialString = val;
    
    const char *str = [serialString UTF8String];
    
    FREObject retStr;
    FRENewObjectFromUTF8(strlen(str)+1, (const uint8_t*)str, &retStr);
    
    return retStr;
}

FREObject getUdid (FREContext ctx, void* funcData, uint32_t argc,FREObject argv[])
{
    NSLog(@"Entering hellow World()");
    
    NSString *udid = [[UIDevice currentDevice] uniqueIdentifier];
    NSString *val = udid;
    
    
    NSString *udidString = val;
    
    const char *str = [udidString UTF8String];
    
    FREObject retStr;
    FRENewObjectFromUTF8(strlen(str)+1, (const uint8_t*)str, &retStr);
    
    return retStr;
}

void LNGenericANEContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionToTest, const FRENamedFunction** functionsToSet){
    
    NSLog(@"Entering ContextInitializer()");
    
    *numFunctionToTest = 2;
    
    FRENamedFunction* func = (FRENamedFunction*)malloc(sizeof(FRENamedFunction)* *numFunctionToTest);
    
    func[0].name = (const uint8_t*)"getSerial";
    func[0].functionData = NULL;
    func[0].function = &getSerial;
    
    func[1].name = (const uint8_t*)"getUdid";
    func[1].functionData = NULL;
    func[1].function = &getUdid;
    
    *functionsToSet = func;
    
    NSLog(@"Existing ContextInitializer");
}

void LNGenericANEContextFinalizer(FREContext ctx)
{
    NSLog(@"Extering ContexFinalizer()");
    NSLog(@"Existing ContexFinalizer()");
    
    return;
}

void LNGenericANEInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet)
{
    NSLog(@"Entering ExtInit");
    *extDataToSet = NULL;
    *ctxInitializerToSet = &LNGenericANEContextInitializer;
    *ctxFinalizerToSet = &LNGenericANEContextFinalizer;
}

void LNGenericANEFinalizer(void* extData){
    NSLog(@"Finalizar");
    NSLog(@"Finalizar");
    return;
}