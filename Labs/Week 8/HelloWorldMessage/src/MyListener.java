import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;

public class MyListener implements MessageListener
{
	public void onMessage(Message message)
	{
		TextMessage textMessage = (TextMessage) message;

		try
		{
			System.out.println("Received By Listener: " + textMessage.getText());
		}

		catch(JMSException jmsExc)
		{
			jmsExc.printStackTrace();
		}
	}
}
