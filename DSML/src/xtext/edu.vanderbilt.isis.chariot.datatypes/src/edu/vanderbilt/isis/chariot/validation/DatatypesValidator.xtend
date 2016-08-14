/*
 * generated by Xtext
 */
package edu.vanderbilt.isis.chariot.validation
import com.google.inject.Inject
import org.eclipse.xtext.validation.Check
import edu.vanderbilt.isis.chariot.datatypes.MessageElement
import edu.vanderbilt.isis.chariot.AllowableTypes
import static edu.vanderbilt.isis.chariot.datatypes.DatatypesPackage.Literals.*
/**
 * This class contains custom validation rules. 
 *
 * See https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#validation
 */
class DatatypesValidator extends AbstractDatatypesValidator {
	public static val ILLEGAL_TYPE = 'issue.illegalType'
	@Inject extension AllowableTypes allowableTypes
	
	/**
	 * Method to check for valid data type definition.
	 * 
	 * @param element	Message (data type) element to check for validity.
	 */
	@Check
	def checkDataTypesDefined(MessageElement element) {
		if(element.type!=null){
			if(!element.type.isMongoType){
				error('Only certain types are allowed.Please see documentation.', 
					   MESSAGE_ELEMENT__TYPE, 
					   ILLEGAL_TYPE)
			} 
		}
	}
	
	/**
	 * Method to check for valid array declaration.
	 * 
	 * @param element	Message (data type) element to check for validity.
	 */
	@Check
	def checkArrayDeclaration(MessageElement element) {
		if(element.type!=null && element.isIsArray){
			if(!element.type.type.isMongoBean){
				error('We only support List of Message Declarations. 
						Primitive type list is not supported.', 
					  MESSAGE_ELEMENT__TYPE,
					  ILLEGAL_TYPE)
			} 
		}
	}
}