//
// RBFileGenerator.h
//
// Copyright (c) 2011 Robert Brown
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

#import <UIKit/UIKit.h>

@class RBFile;

/**
 *  This protocol is to be conformed to for all StatCollection file generators.
 *  This may be used for .csv, .xml, Stata format, whatever.
 */
@protocol RBFileGenerator <NSObject>

@required

/**
 *  Returns the path to the file that was generated.
 */
- (NSString *) generateFile;

/**
 *  Returns an RBFile.
 */
- (RBFile *) generateRBFile;

/**
 *  Returns the mime type of the files that this RBFileGenerator will generate.
 *  This information can be valuable for sending emails and such.
 */
- (NSString *) MIMEType;

@end
