/**
 *  LGSPlatformPromptTextView.m
 *  LGS
 *
 *  Created by Mathieu LEDRU on 08/11/09.
 *
 *  BSD License:
 *  Copyright (c) 2010, Mathieu LEDRU
 *
 *  All rights reserved.
 *  Redistribution and use in source and binary forms, with or without modification,
 *  are permitted provided that the following conditions are met:
 *
 *  *   Redistributions of source code must retain the above copyright notice,
 *      this list of conditions and the following disclaimer.
 *  *   Redistributions in binary form must reproduce the above copyright notice,
 *      this list of conditions and the following disclaimer
 *      in the documentation and/or other materials provided with the distribution.
 *  *   Neither the name of the Mathieu LEDRU nor the names of its contributors
 *      may be used to endorse or promote products derived from this software
 *      without specific prior written permission.
 *
 *  THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND ANY
 *  EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 *  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 *  DISCLAIMED. IN NO EVENT SHALL THE REGENTS AND CONTRIBUTORS BE LIABLE FOR ANY
 *  DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 *  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 *  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 *  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 *  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 */

#import "LGSPlatformPromptTextView.h"

#import "LGSDefaultViewController.h"

@implementation LGSPlatformPromptTextView

-(id) initWithFrame:(CGRect) frameRect andText:(id) aString rotate:(LGSBoxViewOrientation) orient andType:(LGSBoxViewType) aType
{
	if(self = [super initWithFrame:frameRect andText:aString rotate:orient andType:aType])
	{
		LGSView* mainView = [LGSDefaultViewController getMainView];
		CGSize frameRatio = CGSizeMake(mainView.frame.size.width / 342, mainView.frame.size.height / 512); //ratio scale according to original window size (512x342)
        frameRatio = CGSizeMake(1.0, 1.0);
		
		textField = [[[UITextField alloc] initWithFrame:LGSMakeResizeRect(6, 42 - 20, 150, 20, frameRatio)] autorelease];

		[textField setBorderStyle:UITextBorderStyleLine];
		[textField setFont:[UIFont fontWithName:@"Arial" size:14.0f]];
		[textField setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleHeight];
		[textField setDelegate:self];
		[textField addToView:self withTarget:self isHidden:NO];
	}
	return self;
}

-(BOOL) textFieldShouldReturn:(UITextField*) aTextField
{
	[aTextField resignFirstResponder];
	return YES;
}

-(NSString*) textValue
{
	return [textField text];
}

@end
