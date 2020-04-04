import React from 'react';
import Page from '../layout/Page';
import styled from 'styled-components';
import { ReactComponent as Game } from '../images/jigsaw.svg';
import { ReactComponent as Question } from '../images/question.svg';
import { ControlItem } from '../components/ControlItem';
import { ControlIconBox } from '../components/ControlIconBox';
import { Link } from 'react-router-dom';

const ControlItemsGrid = styled.div`
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  grid-gap: 75px 81px;
`;

const StyledLink = styled(Link)`
  width: 100%;
  text-align: center;
`;

export interface SendNotificationProps {}

const SendNotification: React.SFC<SendNotificationProps> = () => {
  return (
    <Page topBarHeaderTitle="Send out Notification">
      <ControlItemsGrid>
        <ControlItem>
          <StyledLink to="/write-question">
            <ControlIconBox>
              <Question />
            </ControlIconBox>
            Question
          </StyledLink>
        </ControlItem>
        <ControlItem>
          <ControlIconBox>
            <Game />
          </ControlIconBox>
          Game
        </ControlItem>
        <ControlItem>
          <ControlIconBox></ControlIconBox>
          Image
        </ControlItem>
        <ControlItem>
          <ControlIconBox></ControlIconBox>
          Phone Message
        </ControlItem>
        <ControlItem>
          <ControlIconBox></ControlIconBox>
          Story
        </ControlItem>
        <ControlItem>
          <ControlIconBox></ControlIconBox>
          Other feature
        </ControlItem>
      </ControlItemsGrid>
    </Page>
  );
};

export default SendNotification;
