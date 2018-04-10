import org.w3c.dom.Document;
import org.xml.sax.SAXException;

import javax.xml.XMLConstants;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;
import javax.xml.validation.Validator;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

public class XsltTransformation
{
	public static void main(String args[])
	{
		// Load the file
		File shipment = new File("shipment.xml");

		// Create a DocumentBuilderFactory
		DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();

		// Set namespace aware
		documentBuilderFactory.setNamespaceAware(true);

		// Create a document builder
		DocumentBuilder documentBuilder = null;

		// Try to initialise the DocumentBuilder
		try
		{
			documentBuilder = documentBuilderFactory.newDocumentBuilder();

			// Create a document
			Document document = null;

			// Try to parse the file into the document
			try
			{
				document = documentBuilder.parse(shipment);

				// Load the XML Schema and create a validator
				SchemaFactory schemaFactory = SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);
				Schema schema = schemaFactory.newSchema(new File("shipment.xsd"));
				Validator validator = schema.newValidator();

				// Validate the XML file against the schema
				validator.validate(new DOMSource(document));

				// Transform the XML to HTML
				TransformerFactory transformerFactory = TransformerFactory.newInstance();
				Transformer transformer = null;

				try
				{
					transformer = transformerFactory.newTransformer(new StreamSource("shipment.xsl"));

					// Try to transform the XML to HTML
					try
					{
						transformer.transform(new StreamSource("shipment.xml"), new StreamResult(new FileOutputStream("shipment.html")));

						System.out.println("Output written to HTML file: shipment.html");
					}
					catch(TransformerException tExc)
					{
						System.out.println("TransformerException: " + tExc);
					}
				}
				catch(TransformerConfigurationException tcExc)
				{
					System.out.println("TransformerConfigurationException: " + tcExc);
				}
			}
			catch(SAXException saxExc)
			{
				System.out.println("SAXException: " + saxExc);
			}
			catch(IOException ioExc)
			{
				System.out.println("IOException: " + ioExc);
			}
		}
		catch(ParserConfigurationException pcExc)
		{
			System.out.println("ParserConfigurationException: " + pcExc);
		}
	}
}