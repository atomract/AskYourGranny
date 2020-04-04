import React from 'react';
import styled from 'styled-components';
import { ReactComponent as Chat } from '../images/chat.svg';
import { ReactComponent as BirthdayAndParty } from '../images/birthday-and-party.svg';
import SignUpSection from '../templates/SignUpSection';

export interface LoginProps {}

const PageLayout = styled.main`
  position: relative;
  width: 100vw;
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  background-image: linear-gradient(185.67deg, #8689ff 0%, #4e51ff 100%);
  opacity: 0.9497767857142857;
`;

const InnerContent = styled.div`
  width: 100%;
  max-width: 1311px;
  height: 100%;
  position: relative;
`;

const TopText = styled.p`
  position: absolute;
  top: 91px;
  left: 50%;
  transform: translateX(-50%);
  font-weight: 900;
  color: #676ae0;
  font-size: 36px;
  line-height: 43px;
  text-align: center;
  white-space: nowrap;
`;

const Login: React.FunctionComponent<LoginProps> = () => {
  return (
    <PageLayout>
      <InnerContent>
        <Chat style={{ position: 'absolute', left: 0, top: 91 }} />
        <TopText>
          UME - Through simple notifications
          <br />
          connect and interact with your seniors
        </TopText>
        <BirthdayAndParty style={{ position: 'absolute', right: 0, bottom: 34 }} />
        <SignUpSection
          style={{ margin: '0 auto', marginTop: 300, marginBottom: 134 }}
        ></SignUpSection>
      </InnerContent>
    </PageLayout>
  );
};

export default Login;
