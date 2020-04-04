import React from 'react';
import { ReactComponent as ChatCopy } from '../images/chat-copy.svg';
import { ProjectName } from '../templates/TopBar';
import { Link } from 'react-router-dom';

export const Logo: React.FunctionComponent = () => (
  <Link to="/">
    <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center' }}>
      <ChatCopy />
      <ProjectName>UME</ProjectName>
    </div>
  </Link>
);
