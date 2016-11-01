/*
 * generated by Xtext 2.10.0
 */
package org.xtext.example.mydsl.formatting2

import org.eclipse.xtext.formatting2.AbstractFormatter2
import org.eclipse.xtext.formatting2.IFormattableDocument
import org.xtext.example.mydsl.myDsl.ListEntry
import org.xtext.example.mydsl.myDsl.Model
import org.xtext.example.mydsl.myDsl.Punctuation
import org.xtext.example.mydsl.myDsl.TextContent

import static org.xtext.example.mydsl.myDsl.MyDslPackage.Literals.*

class MyDslFormatter extends AbstractFormatter2 {

	def dispatch void format(Model model, extension IFormattableDocument document) {
		model.entries.forEach[format]
		model.entries.tail.forEach[regionFor.keyword('-').prepend[newLine]]
	}

	def dispatch void format(ListEntry entry, extension IFormattableDocument document) {
		entry.contents.forEach[format]
	}

	def dispatch void format(TextContent content, extension IFormattableDocument document) {
		content.regionFor.feature(ENTRY_CONTENT__VALUE).prepend[oneSpace]
	}

	def dispatch void format(Punctuation content, extension IFormattableDocument document) {
		content.regionFor.feature(ENTRY_CONTENT__VALUE).prepend[noSpace]
	}

}
