import React from 'react';
import styled from 'styled-components';
import TopBar from '../templates/TopBar';

const Layout = styled.div`
  display: grid;
  grid-template-columns: 1fr;
  grid-template-rows: 143px 1fr;
  background-color: #f9f9f9;
  width: 100vw;
  min-height: 100vh;
`;

const Body = styled.main`
  padding: 96px 64px;
`;

export interface PageProps {
  topBarHeaderTitle: string;
}

const Page: React.SFC<PageProps> = ({ topBarHeaderTitle, children }) => {
  return (
    <Layout>
      <TopBar>{topBarHeaderTitle}</TopBar>
      <Body>{children}</Body>
    </Layout>
  );
};

export default Page;
