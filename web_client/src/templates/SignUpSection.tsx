import React from 'react';
import { withFirebase } from '../utils/withFirebase';
import Firebase from '../services/firebase';
import styled from 'styled-components';
import { TextField } from '@material-ui/core';

export interface SignUpSectionProps {
  firebase?: Firebase;
  style?: React.CSSProperties;
}

const LayoutBody = styled.section`
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 72px 107px;
  background-color: #ffffff;
  border-radius: 38px;
  box-shadow: 0 0 22px 0 rgba(0, 0, 0, 0.5);
  width: 589px;
  height: 589px;
  z-index: 999;
`;

const SignUpTopText = styled.p`
  font-size: 40px;
  font-weight: 700;
  line-height: 48px;
  text-align: center;
`;

const SignUpSection: React.SFC<SignUpSectionProps> = ({ firebase, style }) => {
  return (
    <LayoutBody style={style}>
      <SignUpTopText>
        Sign Up for
        <br />
        UME to connect
        <br />
        with your seniors!
      </SignUpTopText>
      <TextField id="email" label="Email" />
      <TextField id="password" label="Password" />
    </LayoutBody>
  );
};

export default withFirebase(SignUpSection);
