import React from "react";
import Feature from "../Features/Feature";
import { MdGppGood, MdLibraryAddCheck, MdLock, MdShare } from "react-icons/md";

const Features = () => {
  return (
    <div className="features-wrapper">
      <div className="title-large">Kenya's New Revolutionary E-voting Framework</div>
      <div className="title-small">
        Blockchain is a promising technology that has the potential to revolutionize
        Kenya's Electoral Framework. Here are some of its amazing features that make it
        stand out:
      </div>

      <div className="mobile-wrapper">
        <div>
          <Feature title="Immutability" icon={<MdLock />} align="right">
            <p>
              Immutability means something that can’t be changed or altered.
              This is one of the top blockchain features that help to ensure
              that the technology will remain as it is, a permanent, unalterable
              network.
            </p>
          </Feature>
        </div>

        <div className="mobile-container">
        <img src="/kenya.jpg" alt="Kenyan Picture" width="350" height="350" />
        </div>

        <div>
          <Feature title="Enhanced Security" icon={<MdGppGood />} align="left">
            <p>
              Enhanced security is one of the most important features of blockchain
              technology. It ensures that all transactions are secure, transparent,
              and tamper-proof, making it an ideal solution for sensitive data
              management.
            </p>
          </Feature>
        </div>
        <div>
          <Feature title="Decentralized" icon={<MdShare />} align="right">
            <p>
              Decentralization is a core feature of blockchain technology that
              eliminates the need for a central authority or intermediary. This
              means that no single entity has control over the entire network,
              making it more secure and resistant to attacks or fraud.
            </p>
          </Feature>
        </div>
        <div>
          <Feature
            title="Distributed Ledger"
            icon={<MdLibraryAddCheck />}
            align="left"
          >
            <p>
              A distributed ledger is a database that is shared and synchronized
              across multiple locations or nodes. It allows for secure and transparent
              record-keeping, making it an essential feature of blockchain technology.
              Each participant in the network has access to the same information,
              ensuring trust and accountability.
            </p>
          </Feature>
        </div>
      </div>
    </div>
  );
};

export default Features;
