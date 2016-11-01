package org.xtext.example.mydsl.tests

import javax.inject.Inject
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.XtextRunner
import org.eclipse.xtext.junit4.formatter.FormatterTester
import org.junit.Test
import org.junit.runner.RunWith

@RunWith(XtextRunner)
@InjectWith(MyDslInjectorProvider)
class MyDslFormatterTest {

	@Inject extension FormatterTester formatterTester

	@Test
	def void formatWithNodeModelAndSerializer() {
		assertFormatted [
			expectation = '''
				- a simple entry.
			'''
			toBeFormatted = '''
				-    a   simple   entry   .
			'''
		]
	}

	@Test
	def void formatWithNodeModel() {
		assertFormatted [
			useSerializer = false
			expectation = '''
				- a simple entry.
			'''
			toBeFormatted = '''
				-    a   simple   entry   .
			'''
		]
	}

	@Test
	def void formatWithSerializer() {
		assertFormatted [
			useNodeModel = false
			expectation = '''
				- a simple entry.
			'''
			toBeFormatted = '''
				-    a   simple   entry   .
			'''
		]
	}

}
