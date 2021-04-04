// Name of the package
package project_elec6181;

// Importing required packages from the inet framework
import inet.examples.inet.netperfmeter.coreChannel;
import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.common.misc.ThruputMeteringChannel;
import inet.node.ethernet.Eth100M;
import inet.node.inet.Router;
import inet.node.inet.StandardHost;
@license(LGPL);

// Network Name and it's Components
network NetworkWithShapingAndPolicing
{
//    Parametes option to specify the edge and core data rate for the transmission
    parameters:
        double edgeDatarate @unit(bps);
        double coreDatarate @unit(bps);
        @display("bgb=1772.76,681.36");
//        Types of wires between the routers and defining their properties
    types:
        channel edgeline extends ThruputMeteringChannel
        {
            delay = 2ms;
            datarate = edgeDatarate;
            thruputDisplayFormat = "b B U";
        }
        channel coreline extends ThruputMeteringChannel
        {
            delay = 2ms;
            datarate = coreDatarate;
            thruputDisplayFormat = "b B U";
        }
//        Submodules for placement of routers and Hosts
    submodules:
        R1: Router {
            @display("p=301.92,252.96");
            gates:
                ethg[1];
        }
        R2: Router {
            @display("p=420.24,395.76");
        }
        R3: Router {
            @display("p=301.92,599.76");
        }
        R4: Router {
            @display("p=440.64,91.8");
        }
        R5: Router {
            @display("p=699.72,91.8");
        }
        R6: Router {
            @display("p=620.16,599.76");
        }
        R7: Router {
            @display("p=732.36,395.76");
        }

        R11: Router {
            @display("p=1168.92,75.48");
        }
        R12: Router {
            @display("p=1326,324.36");
        }
        R13: Router {
            @display("p=1430.04,75.48");
        }
        R9: Router {
            @display("p=1089.36,324.36");
        }
        R10: Router {
            @display("p=1189.32,575.28");
        }
        R14: Router {
            @display("p=1476.96,575.28");
        }
        R8: Router {
            @display("p=899.64,252.96");
        }
        R15: Router {
            @display("p=1509.6,324.36");
            gates:
                ethg[1];
        }
        H1: StandardHost {
            @display("p=140.76,324.36");
            gates:
                ethg[1];
        }
        H2: StandardHost {
            @display("p=1697.28,324.36");
            gates:
                ethg[1];
        }
        configurator: Ipv4NetworkConfigurator {
            @display("p=75.48,599.76");
        }
    connections:
        //Connections shown between hosts and routers
        H1.ethg[0] <--> Eth100M <--> R1.ethg[0];
        H2.ethg[0] <--> Eth100M <--> R15.ethg[0];
		
		//Connections shown between routers
        R1.pppg++ <--> edgeline <--> R4.pppg++;
        R1.pppg++ <--> edgeline <--> R2.pppg++;
        R13.pppg++ <--> edgeline <--> R15.pppg++;
        R12.pppg++ <--> edgeline <--> R15.pppg++;
        R2.pppg++ <--> edgeline <--> R3.pppg++;
        R7.pppg++ <--> edgeline <--> R8.pppg++;
        R3.pppg++ <--> edgeline <--> R6.pppg++;
        R13.pppg++ <--> edgeline <--> R11.pppg++;
        R2.pppg++ <--> coreline <--> R7.pppg++;
        R4.pppg++ <--> edgeline <--> R5.pppg++;
        R5.pppg++ <--> coreline <--> R8.pppg++;
        R7.pppg++ <--> coreline <--> R6.pppg++;
        R8.pppg++ <--> coreline <--> R9.pppg++;
        R9.pppg++ <--> coreline <--> R12.pppg++;
        R9.pppg++ <--> coreline <--> R11.pppg++;
        R9.pppg++ <--> coreline <--> R10.pppg++;
        R10.pppg++ <--> coreline <--> R14.pppg++;
        R14.pppg++ <--> coreline <--> R15.pppg++;
}