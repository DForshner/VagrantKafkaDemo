using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using KafkaNet;
using KafkaNet.Model;
using KafkaNet.Protocol;

namespace ProducerDemo
{
    class ProducerMain
    {
        static void Main(string[] args)
        {
            var options = new KafkaOptions(new Uri("http://localhost:9092"));
            var router = new BrokerRouter(options);
            var client = new Producer(router);

            client.SendMessageAsync("TestHarness", new[] { new Message("hello world") }).Wait();

            using (client) { }
        }
    }
}
