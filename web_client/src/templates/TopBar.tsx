import React from 'react';
import styled from 'styled-components';
import { Logo } from '../components/Logo';

const Header = styled.header`
  background-color: #ffffff;
  border-radius: 8px;
  box-shadow: 0 2px 8px 0 rgba(0, 0, 0, 0.14);
`;

const InnerContent = styled.div`
  display: grid;
  grid-template-columns: 98px 1fr 104px;
  padding: 0 40px;
  height: 143px;
  align-items: center;
`;

export const ProjectName = styled.span`
  color: #a8abf1;
  font-size: 36px;
  font-weight: 900;
  line-height: 43px;
  text-align: center;
`;

const AppHeaderText = styled.div`
  color: #000000;
  font-size: 36px;
  font-weight: 900;
  line-height: 43px;
  text-align: center;
`;

const ProfileThumbnail = () => (
  // TODO: use normal profile logo instead of this
  <div style={{ borderRadius: '50%', width: 53, height: 53, backgroundColor: '#D8D8D8' }}></div>
);

export interface TopBarProps {}

const TopBar: React.SFC<TopBarProps> = ({ children }) => {
  return (
    <Header>
      <InnerContent>
        <Logo />
        <AppHeaderText>{children}</AppHeaderText>
        <ProfileThumbnail />
      </InnerContent>
    </Header>
  );
};

export default TopBar;
