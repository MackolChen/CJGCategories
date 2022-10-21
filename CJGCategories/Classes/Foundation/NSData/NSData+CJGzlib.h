
//https://github.com/bitbasenyc/nsdata-zlib
@interface NSData (CJGzlib)

/**
 ZLib error domain
 */
extern NSString *const CJGZlibErrorDomain;
/**
 When a zlib error occurs, querying this key in the @p userInfo dictionary of the
 @p NSError object will return the underlying zlib error code.
 */
extern NSString *const CJGZlibErrorInfoKey;

typedef NS_ENUM(NSUInteger, CJGZlibErrorCode) {
    CJGZlibErrorCodeFileTooLarge = 0,
    CJGZlibErrorCodeDeflationError = 1,
    CJGZlibErrorCodeInflationError = 2,
    CJGZlibErrorCodeCouldNotCreateFileError = 3,
};

/**
 Apply zlib compression.

 @param error If an error occurs during compression, upon return contains an
 NSError object describing the problem.

 @returns An NSData instance containing the result of applying zlib
 compression to this instance.
 */
- (NSData *)cjg_dataByDeflatingWithError:(NSError *__autoreleasing *)error;

/**
 Apply zlib decompression.

 @param error If an error occurs during decompression, upon return contains an
 NSError object describing the problem.

 @returns An NSData instance containing the result of applying zlib
 decompression to this instance.
 */
- (NSData *)cjg_dataByInflatingWithError:(NSError *__autoreleasing *)error;

/**
 Apply zlib compression and write the result to a file at path

 @param path The path at which the file should be written

 @param error If an error occurs during compression, upon return contains an
 NSError object describing the problem.

 @returns @p YES if the compression succeeded; otherwise, @p NO.
 */
- (BOOL)cjg_writeDeflatedToFile:(NSString *)path
                          error:(NSError *__autoreleasing *)error;

/**
 Apply zlib decompression and write the result to a file at path

 @param path The path at which the file should be written

 @param error If an error occurs during decompression, upon return contains an
 NSError object describing the problem.

 @returns @p YES if the compression succeeded; otherwise, @p NO.
 */
- (BOOL)cjg_writeInflatedToFile:(NSString *)path
                          error:(NSError *__autoreleasing *)error;
@end
